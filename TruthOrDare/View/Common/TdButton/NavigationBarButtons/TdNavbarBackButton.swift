//
//  TdNavbarBackButton.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import SwiftUI

struct TdNavbarBackButton: View {
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .offset(x: -1)
                .modifier(TdNavbarButtonModifier())
        }
        .buttonStyle(.plain)
    }
}

struct TdNavbarBackButton_Previews: PreviewProvider {
    static var previews: some View {
        TdNavbarBackButton {}
    }
}
