//
//  StoreKitManager.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import StoreKit

final class StoreKitManager: ObservableObject {
    static let shared = StoreKitManager()

    private enum IAPProducts: String, CaseIterable {
        case truthOrDareFullAccess
    }
    enum PurchaseError: Error {
        case failed, cancelled, pending, userCannotMakePayments, purchaseException
    }

    @Published private(set) var products: [Product]?
    @Published private(set) var transactions = Set<Transaction>()
    private var transactionListener: Task<Void, Error>?

    init() {
        transactionListener = handleTransactions()
        Task {
            try? await loadProducts()
        }
    }

    deinit { transactionListener?.cancel() }

    @MainActor public func requestProductsFromAppStore(productIds: Set<String>) async -> [Product]? {
        try? await Product.products(for: productIds)
    }

    @MainActor public func purchase(_ product: Product) async throws -> Transaction? {

        guard AppStore.canMakePayments else { throw PurchaseError.userCannotMakePayments }
        guard let result = try? await product.purchase() else { throw PurchaseError.purchaseException }

        switch result {
        case .pending:
            throw PurchaseError.pending
        case .success(let verification):
            let transaction = try checkVerified(verification)
            await transaction.finish()
            return transaction
        case .userCancelled:
            throw PurchaseError.cancelled
        @unknown default:
            assertionFailure("Unexpected result")
            throw PurchaseError.failed
        }

    }

    @MainActor private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            UserDefaults.standard.set(false, forKey: UDKeys.fa)
            throw PurchaseError.failed
        case .verified(let safe):
            if let trans = safe as? Transaction {
                if trans.productID == IAPProducts.truthOrDareFullAccess.rawValue {
                    UserDefaults.standard.set(true, forKey: UDKeys.fa)
                }
                transactions.insert(trans)
            }
            return safe
        }
    }

    private func handleTransactions() -> Task<Void, Error> {
        Task.detached {
            for await result in Transaction.updates {
                let transaction = try await self.checkVerified(result)
                await transaction.finish()
            }
        }
    }

    @MainActor private func isPurchased(_ productID: String) async throws -> Bool {
        guard let result = await Transaction.currentEntitlement(for: productID) else {
            return false
        }
        let transaction = try checkVerified(result)

        return transaction.revocationDate == nil
        && !transaction.isUpgraded
    }

    @MainActor func loadProducts() async throws {
        Task.init {
            products = await requestProductsFromAppStore(productIds: Set(IAPProducts.allCases.compactMap {$0.rawValue}))?.sorted(by: {$0.price < $1.price})
            if let prods = products {
                for product in prods {
                    _ = try? await isPurchased(product.id)
                }
            }

        }
    }

}
