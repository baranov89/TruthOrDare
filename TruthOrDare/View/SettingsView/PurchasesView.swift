//
//  PurchaseView.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import SwiftUI
import StoreKit

struct PurchasesView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage(UDKeys.fa) private var fullAccess = false
    @ObservedObject private var store = StoreKitManager.shared
    @State private var inProgressPurchasing = false
    @State private var transactionError: Error?

    private struct PurshaseModel: Identifiable {
        let id = UUID()
        let image: String
        let title: String
    }

    private let purchaseAnnotations = [
        PurshaseModel(image: "PurshaseQuestion",
                      title: NSLocalizedString("All questions", comment: "purchase annotation")),
        PurshaseModel(image: "PurchaseNoAds",
                      title: NSLocalizedString("100% ad-free", comment: "purchase annotation")),
        PurshaseModel(image: "PurchaseSyncDiveces",
                      title: NSLocalizedString("Data synchronization", comment: "purchase annotation"))
    ]

    init() {
        UINavigationBar
            .appearance()
            .setNavigationBarColor(titleColor: .white, backgroundColor: .clear)
    }

    var body: some View {
        ZStack {
            Color.TD.purchasesViewGradient
                .ignoresSafeArea()
            VStack {
                Image("Diamond")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                ForEach(purchaseAnnotations) { item in
                    HStack {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text(item.title)
                            .tdTypo(.body3, color: .white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                if fullAccess {
                    Spacer()
                    Text("Great!\nYou have full access!")
                        .tdTypo(.title4, color: .white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else {
                    if let product = store.products?.first {
                        purchaseView(product: product)
                    } else {
                        noProductsView()
                    }
                }
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width)
            if fullAccess {
                LottieView(lottieFile: "success")
                    .ignoresSafeArea()
                    .scaledToFill()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Full access")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                TdNavbarBackButton {
                    dismiss()
                }
            }
        }
    }

    private func purchaseView(product: Product) -> some View {
        VStack {
            LottieView(lottieFile: "purchase")
            Spacer()
            Text("All this for just \(product.displayPrice)")
                .tdTypo(.headline1, color: .white)
            TdProgressButton(title: NSLocalizedString("Buy", comment: "purchase button"),
                             inProgress: inProgressPurchasing,
                             background: Color.TD.orangeGradient) {
                startPurchase(product: product)
            }
            Text("If you have problems with payment, then write to TrueOrDare@vsa.su")
                .tdTypo(.body7, color: .white)
                .multilineTextAlignment(.center)
        }
    }
    private func noProductsView() -> some View {
        VStack {
            Spacer()
            LottieView(lottieFile: "errorOccurred")
                .frame(width: 200, height: 200)
            Spacer()
            Text("There is something wrong with your internet connection.\nTry refreshing your data...")
                .tdTypo(.headline1, color: .white)
                .multilineTextAlignment(.center)
            Spacer()
            TdProgressButton(title: NSLocalizedString("Refresh", comment: "purchase button"),
                             inProgress: inProgressPurchasing,
                             background: Color.gray) {
                refreshProducts()
            }
        }

    }

    private func startPurchase(product: Product) {
        Task {
            inProgressPurchasing = true
            do {
                _ = try await store.purchase(product)
                inProgressPurchasing = false
            } catch {
                inProgressPurchasing = false
            }
        }
    }
    private func refreshProducts() {
        Task {
            do {
                try await store.loadProducts()
                inProgressPurchasing = false
            } catch {
                inProgressPurchasing = false
            }
        }
    }

}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesView()
    }
}
