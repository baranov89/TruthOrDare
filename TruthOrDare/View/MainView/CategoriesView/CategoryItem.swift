//
//  CategoryItem.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 09.09.2022.
//

import SwiftUI

struct CategoryItem: View {
    var category: CategoryModel

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
//                Image(category.icon)
//                    .frame( maxWidth: .infinity, maxHeight: 60, alignment: .center)
                Text(category.title)
                    .multilineTextAlignment(.center)
                    .tdTypo(.body4, color: .black)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: 166, minHeight: 119, alignment: .bottom)
            .background(category.background)
            HStack {
                Text("\(category.countCarts)" + NSLocalizedString(" cards", comment: ""))
                    .tdTypo(.headline5, color: .red)
                    .padding()
                Spacer()
                if category.isLock {
                    Image("Lock")
                        .renderingMode(.none)
                        .padding()
                }
            }
            .frame(width: 166, height: 47, alignment: .center)
            .background(.white)
        }
        .frame(maxWidth: 166, minHeight: 166, alignment: .center)
        .cornerRadius(20)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: CategoriesMain.best)
    }
}
