//
//  TdProgressButton.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import SwiftUI

struct TdProgressButton<T: View>: View {
    let title: String
    let inProgress: Bool
    let background: T
    let action: () -> Void

    var body: some View {
        if inProgress {
            TdActionButton(title: "", background: background, action: action)
                .overlay(
                    TdActivityIndicator(color: .white, size: 24, thickness: 4)
                )
                .disabled(inProgress)
        } else {
            TdActionButton(title: title, background: background, action: action)
        }
    }
}

// struct TdProgressButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TdProgressButton()
//    }
// }
