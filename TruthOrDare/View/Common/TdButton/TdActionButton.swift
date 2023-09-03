//
//  TDActionButton.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import SwiftUI

struct TdActionButton<T: View>: View {
    let title: String
    let background: T
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .tdTypo(.headline1, color: .white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 68, alignment: .center)
                .background(background)
                .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

struct TDActionButton_Previews: PreviewProvider {
    static var previews: some View {
        TdActionButton(title: "OK", background: Color.TD.greenGradient) {}
    }
}
