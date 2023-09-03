//
//  CategoryModel.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 29.08.2022.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    let title: String
    let icon: String
    var isLock: Bool
    var background: Color
    var questions: [String]
    var actions: [String]
    var countCarts: Int {
        questions.count + actions.count
    }
}
