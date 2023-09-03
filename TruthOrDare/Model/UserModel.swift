//
//  UserModel.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 29.08.2022.
//

import Foundation
import SwiftUI
// import Combine

struct UserModel: Hashable {
    var name: String
    var pointsTruth: Int
    var pointsDare: Int

}
actor One {
    @Published  var value: [String] = []

}
