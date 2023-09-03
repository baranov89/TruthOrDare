//
//  TdNavbarButtonModifire.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 28.08.2022.
//

import SwiftUI

struct TdNavbarButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 20,
                   height: 20)
            .padding(10)
            .background(Color.TD.smallButtonBackground)
            .cornerRadius(12)
    }
}
