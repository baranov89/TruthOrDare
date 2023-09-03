//
//  ResultView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 11.01.2023.
//

import SwiftUI

struct ResultView: View {
    @State var game: GameModel
    @State var title: String
    @State var showNavigationBar: Bool
    @State private var showMainView: Bool = false

    var body: some View {
        VStack {
            Text(title)
                .tdTypo(.title4)
                .padding()
            ScrollView {
                ForEach(game.users.indices, id: \.self) {index in
                    ResultItemView(user: game.users[index], count: index + 1)
                        .padding(.horizontal)
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if showNavigationBar {
                    TdNavbarBackButton {
                        showMainView.toggle()
                    }
                }
            }
        }
        .navigateTD(to: MainView().navigationBarBackButtonHidden(true), when: $showMainView)
    }
}

// struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
// }
