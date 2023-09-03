//
//  ChoiceOfMove.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 17.12.2022.
//

import SwiftUI

enum TypeView {
    case dare
    case truth

    func title() -> String {
        switch self {
        case .truth: return NSLocalizedString("Truth", comment: "Truth")
        case .dare: return NSLocalizedString("Dare", comment: "Dare")
        }
    }
}

struct ChoiceOfMoveView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var game: GameModel?
    @State private var fill = 0.0
    @State private var showRulesView = false
    @State private var showtruthOrDareView = false
    @State private var question = ""
    @State private var action = ""
    @State private var showIntermediateRersult = false
    @State private var typeView: TypeView = .truth

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.TD.playerChoiceViewGradient.ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        TdNavbarBackButton {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        if let gameUW = game {
                            HStack {
                                Button {
                                    if let gameUW = game {
                                        gameUW.users = gameUW.users.sorted {
                                            ($0.pointsDare + $0.pointsTruth) > ($1.pointsDare + $1.pointsTruth)
                                        }
                                    }
                                    showIntermediateRersult.toggle()
                                } label: {
                                    Text(String(gameUW.currentRound))
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 41, height: 41)
                            .overlay {
                                ZStack {
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 1)
                                        .opacity(0.1)
                                    Circle()
                                        .trim(from: 0, to: fill)
                                        .stroke(.white, lineWidth: 2)
                                        .rotationEffect(.init(degrees: -90))
                                        .animation(.default, value: fill)
                                }
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        TdNavbarButton(image: "Help") {
                            showRulesView.toggle()
                        }
                        .sheet(isPresented: $showRulesView) {
                            RulesView()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.automatic)
            ZStack {
                Color.TD.mainViewGradient.ignoresSafeArea(.all)
                VStack {
                    if let gameUW = game {
                        if let user = gameUW.users[gameUW.currentUser] {
                            Text(user.name)
                                .tdTypo(.title4, color: .white)
                                .padding()
                        }
                    }
                    Text("Your move")
                        .tdTypo(.body1, color: .white)
                    Spacer()
                    VStack(spacing: 20) {
                        TdActionButton(title: NSLocalizedString("Truth", comment: "choice move"), background: Color.TD.orangeGradient) {
                            typeView = .truth
                            pushActionButton()
                        }
                        .padding(.horizontal)
                        TdActionButton(title: NSLocalizedString("Dare", comment: "choice move"), background: Color.TD.greenGradient) {
                            typeView = .dare
                            pushActionButton()
                        }
                        .padding(.horizontal)
                        TdActionButton(title: NSLocalizedString("Random", comment: "choice move"), background: Color.clear) {
                            let random = Bool.random()
                            if random {
                                typeView = .dare
                            } else {
                                typeView = .truth
                            }
                            pushActionButton()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(.white, lineWidth: 4)
                        )
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .navigateTD(to: TruthOrDareView(game: $game, fillTimerCircle: $fill, question: question, action: action, typeView: typeView), when: $showtruthOrDareView)
            if showIntermediateRersult {
                if let gameUW = game {
                    ResultView(game: gameUW, title: NSLocalizedString("Results", comment: ""), showNavigationBar: false)
                    .background(.white)
                    .cornerRadius(40)
                    .padding()
                    .zIndex(2)
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .animation(.default.speed(1), value: showIntermediateRersult)
        .ignoresSafeArea(edges: .bottom)
    }

    private func getAction() -> String {
        var action = ""
        if let gameUW = game {
            var actions: [String]
            actions = gameUW.actions
            var randomInt: Int
            if actions.count > 1 {
                randomInt = Int.random(in: 0..<(actions.count - 1))
            } else {
                randomInt = 0
            }
            action = actions[randomInt]
            gameUW.actions.remove(at: randomInt)
        }
        return action
    }

    private func pushActionButton() {
        action = getAction()
        question = getQuestion()
        showtruthOrDareView.toggle()
    }

    private func getQuestion() -> String {
        var question = ""
        if let gameUW = game {
            var questions: [String]
            questions = gameUW.questions
            var randomInt: Int
            if questions.count > 1 {
                randomInt = Int.random(in: 0..<(questions.count - 1))
            } else {
                randomInt = 0
            }
            question = questions[randomInt]
            gameUW.questions.remove(at: randomInt)
        }
        return question
    }
}

// struct ChoiceOfMoveNew_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoiceOfMoveNew()
//    }
// }
