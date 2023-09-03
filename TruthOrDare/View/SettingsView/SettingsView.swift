//
//  SettingsView.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showPurchasingView = false
    private let store = StoreKitManager.shared

    var body: some View {
        NavigationView {
            ZStack {
                Color.TD.settingsViewGradient
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("Settings")
                        .tdTypo(.title2, color: .white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.vertical])
                    VStack(spacing: 2) {
                        settingCell(title: NSLocalizedString("Buy full access", comment: "settings"),
                                    image: "Diamond") {
                            showPurchasingView.toggle()
                        }
                        settingCell(title: NSLocalizedString("Write a feedback", comment: "settings"),
                                    image: "Message") {

                        }
                        settingCell(title: NSLocalizedString("Rate the app", comment: "settings"),
                                    image: "Star") {

                        }
                        settingCell(title: NSLocalizedString("Share", comment: "settings"),
                                    image: "Share") {

                        }
                    }
                    .cornerRadius(16)
                    Spacer()
                }
                .padding(.horizontal)

            }
            .onAppear {
                Task { try? await store.loadProducts() }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TdNavbarBackButton {
                        dismiss()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigate(to: PurchasesView(), when: $showPurchasingView)
        }
    }

    private func settingCell(title: String, image: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Image(image)
                Text(title)
                    .tdTypo(.body2, color: .white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(.plain)
        .frame(height: 68, alignment: .center)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.5))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
