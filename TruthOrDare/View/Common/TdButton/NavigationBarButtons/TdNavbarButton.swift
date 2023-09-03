//
//  TdNavbarButton.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import SwiftUI

struct TdNavbarButton: View {
    let image: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
                .resizable()
                .modifier(TdNavbarButtonModifier())
        }
    }
}

struct TdNavbarButton_Previews: PreviewProvider {
    static var previews: some View {
        TdNavbarButton(image: "Share") {}
    }
}
