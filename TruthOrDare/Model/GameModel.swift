//
//  GameModel.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 11.10.2022.
//

import Foundation

class GameModel: ObservableObject {
    @Published var currentRound: Int

    func g () {
        currentRound
            .words
    }
    var users: [UserModel]
    var questions: [String]
    var actions: [String]
    var currentUser: Int
    var countRounds: Int

    init(users: [UserModel], round: Int, questions: [String], actions: [String], currentUser: Int, countRounds: Int) {
        self.users = users
        self.currentRound = round
        self.questions = questions
        self.actions = actions
        self.currentUser = currentUser
        self.countRounds = countRounds
    }
}
