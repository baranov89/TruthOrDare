//
//  MenuGame.swift
//  TruthOrDare
//
//  Created by Андрей Костицин on 14.09.2022.
//

import SwiftUI

struct GameMenuView: View {
    var body: some View {
        ZStack {
            Color.TD.settingsViewGradient
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 40) {
                Text("Menu")
                    .tdTypo(.title2, color: .white)
                VStack(spacing: 20) {
                    Rectangle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 70, height: 1)
                    Rectangle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 35, height: 1)
                    Rectangle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 18, height: 1)
                }
                TdActionButton(title: NSLocalizedString("Resume", comment: ""), background: Color.TD.orangeGradient, action: {})
                TdActionButton(title: NSLocalizedString("New game", comment: ""), background: Color.TD.greenGradient, action: {})
                Spacer()
            }
            .padding()
            .padding(.vertical, 100)
            .background(.ultraThinMaterial)
        }
    }
}

struct MenuGame_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
