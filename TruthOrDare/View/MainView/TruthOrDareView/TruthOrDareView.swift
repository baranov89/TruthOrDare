//
//  TruthView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 27.09.2022.
//

import SwiftUI

struct TruthOrDareView: View {
    @Environment(\.dismiss) private var dismiss
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @Binding var game: GameModel?
    @Binding var fillTimerCircle: Double
    @State var question: String
    @State var action: String
    @State private var countTimer = 60
    @State private var showFinishView = false
    @State private var showMainView: Bool = false
    @State var typeView: TypeView

    var body: some View {
        ZStack {
            switch typeView {
            case .dare: Color.TD.dareViewGradient.ignoresSafeArea(.all)
            case .truth: Color.TD.truthViewGradient.ignoresSafeArea(.all)
            }
            VStack {
                Text("\(countTimer)")
                    .tdTypo(.title1)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            VStack {
                Spacer()
                Group {
                    if let gameUW = game {
                        Spacer()
                        Text(typeView.title())
                            .tdTypo(.title2)
                        if let user = gameUW.users[gameUW.currentUser] {
                            Text(user.name)
                                .opacity(0.5)
                        }
                        Divider()
                            .background(.white)
                            .padding()
                        Text(typeView == .truth ?  question : action)
                            .padding(.horizontal)
                    }
                }
                .foregroundColor(.white)
                Spacer()
                Button {
                    if let gameUW = game {
                        switch typeView {
                        case .dare: gameUW.users[gameUW.currentUser].pointsDare += 1
                        case .truth: gameUW.users[gameUW.currentUser].pointsTruth += 1
                        }
                    }
                    getAnswer()
                } label: {
                    getActionButtonLable(text: NSLocalizedString("Ready", comment: "truthOrDare"), point: "+1")
                }
                .buttonStyle(ActionButtonStyle(background: Color.TD.orangeGradient))
                .padding(.horizontal)
                Button {
                    getAnswer()
                } label: {
                    getActionButtonLable(text: NSLocalizedString("Surrender", comment: "truthOrDare"), point: " 0 ")
                }
                .buttonStyle(ActionButtonStyle(background: Color.TD.redGradient))
                .padding()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .background {
            NavigationLink(isActive: $showFinishView) {
                if let gameUW = game {
                    ResultView(game: gameUW, title: NSLocalizedString("End of the game", comment: ""), showNavigationBar: true)
                }
            } label: {
                EmptyView()
            }
        }
        .onReceive(timer) { _ in
            if countTimer > 0 {
                countTimer -= 1
            } else {
                getAnswer()
            }
        }
    }

    private func getAnswer() {
        if let gameUW = game {
            if gameUW.users.count - 1 != gameUW.currentUser {
                gameUW.currentUser += 1
            } else {
                if (gameUW.currentRound + 1) == (gameUW.countRounds + 1) {
                    gameUW.users = gameUW.users.sorted {
                        ($0.pointsDare + $0.pointsTruth) > ($1.pointsDare + $1.pointsTruth)
                    }
                    showFinishView.toggle()
                } else {
                    gameUW.currentRound += 1
                    gameUW.currentUser = 0
                    fillTimerCircle += 1.0 / Double(gameUW.countRounds - 1)
                }
            }
        }
        dismiss()
    }

    private func getActionButtonLable(text: String, point: String) -> some View {
        ZStack {
            Text(text)
            HStack {
                Spacer()
                Rectangle()
                    .frame(width: 1, height: 50, alignment: .center)
                Text(point)
                    .opacity(0.5)
            }
            .padding(.trailing)
        }
    }
}

// struct TruthView_Previews: PreviewProvider {
//    static var previews: some View {
//        TruthView(game: GameModel(users: [UserModel(name: "Player 1")], round: 1, category: CategoriesMain.best, currentUser: UserModel(name: "Player 1")))
//    }
// }
