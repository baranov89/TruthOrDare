//
//  ActionButtonStyle.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 09.10.2022.
//

import SwiftUI

struct ActionButtonStyle<T: View>: ButtonStyle {
    let background: T

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .tdTypo(.headline3, color: .white)
            .frame(maxWidth: .infinity, minHeight: 68, alignment: .center)
            .background(background)
            .cornerRadius(16)
            .brightness(configuration.isPressed ? 0.4 : 0)
    }}

// struct ActionButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionButtonStyle()
//    }
// }
