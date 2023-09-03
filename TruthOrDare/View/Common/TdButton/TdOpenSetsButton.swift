//
//  TdOpenSetsButton.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 10.09.2022.
//

import SwiftUI

struct TdOpenSetsButton<T: View>: View {
    let action: () -> Void
    let text: String
    let image: String
    let background: T

    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 0) {
// offset временно, картинка кривая
                Text(text).offset(y: 35)
                    .tdTypo(.body2, color: .white)
                Image(image)
            }
            .frame(maxWidth: .infinity, minHeight: 166, alignment: .center)
            .background(background)
            .cornerRadius(20)
            .padding(.horizontal, 8)
        }
    }
}

struct TdOpenSetsButton_Previews: PreviewProvider {
    static var previews: some View {
        TdOpenSetsButton(action: {}, text: "Откройте все наборы", image: "Cards", background: Color.TD.orangeGradient)
    }
}
