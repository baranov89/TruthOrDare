//
//  Color+extention.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 08) & 0xFF) / 255,
            blue: Double((hex >> 00) & 0xFF) / 255,
            opacity: alpha
        )
    }

    enum TD {
        static let smallButtonBackground = Color(.sRGB, red: 0.048, green: 0.024, blue: 0.196, opacity: 0.5)
        static let orangeGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.979, green: 0.425, blue: 0.188, opacity: 1),
            Color(.sRGB, red: 1, green: 0.6, blue: 0, opacity: 1)
        ],
                                                   startPoint: UnitPoint(x: 0.25, y: 0.5),
                                                   endPoint: UnitPoint(x: 0.75, y: 0.5)
        )
        static let greenGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.226, green: 0.658, blue: 0.074, opacity: 1),
            Color(.sRGB, red: 0.307, green: 0.746, blue: 0.152, opacity: 1)
        ],
                                                  startPoint: UnitPoint(x: 0.25, y: 0.5),
                                                  endPoint: UnitPoint(x: 0.75, y: 0.5)
        )
        static let redGradient = LinearGradient(colors: [
            Color(.sRGB, red: 1, green: 0.192, blue: 0.192, opacity: 1),
            Color(.sRGB, red: 1, green: 0.371, blue: 0.371, opacity: 1)
        ],
                                                startPoint: UnitPoint(x: 0.25, y: 0.5),
                                                endPoint: UnitPoint(x: 0.75, y: 0.5)
        )
        static let resultPlayerGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.858, green: 0.351, blue: 0.24, opacity: 1),
            Color(.sRGB, red: 0.418, green: 0.161, blue: 0.508, opacity: 1)
        ],
                                                         startPoint: UnitPoint(x: 0.25, y: 0.5),
                                                         endPoint: UnitPoint(x: 0.75, y: 0.5)
        )
        static let mainViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.404, green: 0.082, blue: 0.659, opacity: 1),
            Color(.sRGB, red: 0.875, green: 0.169, blue: 0.451, opacity: 1)
        ],
                                                     startPoint: UnitPoint(x: 0, y: 0),
                                                     endPoint: UnitPoint(x: 1, y: 1)
        )

        static let categoriesViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.278, green: 0.114, blue: 0.546, opacity: 1),
            Color(.sRGB, red: 0.167, green: 0.039, blue: 0.213, opacity: 1)
        ],
                                                           startPoint: UnitPoint(x: 0, y: 0),
                                                           endPoint: UnitPoint(x: 1, y: 1)
        )
        static let purchasesViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.274, green: 0.249, blue: 0.558, opacity: 1),
            Color(.sRGB, red: 0.169, green: 0.024, blue: 0.283, opacity: 1)
        ],
                                                          startPoint: UnitPoint(x: 0, y: 0),
                                                          endPoint: UnitPoint(x: 1, y: 1)
        )

        static  let settingsViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.385, green: 0.249, blue: 0.558, opacity: 1),
            Color(.sRGB, red: 0.169, green: 0.024, blue: 0.283, opacity: 1)
        ],
                                                          startPoint: UnitPoint(x: -0.25, y: 0.5),
                                                          endPoint: UnitPoint(x: 1.75, y: 0.5)
        )
        static  let truthViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.432, green: 0.09, blue: 0.7, opacity: 1),
            Color(.sRGB, red: 0.112, green: 0.026, blue: 0.221, opacity: 1)
        ],
                                                          startPoint: UnitPoint(x: 0, y: 0),
                                                          endPoint: UnitPoint(x: 1, y: 1)
        )
        static  let dareViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.996, green: 0.195, blue: 0.483, opacity: 1),
            Color(.sRGB, red: 0.169, green: 0.024, blue: 0.283, opacity: 1)
        ],
                                                          startPoint: UnitPoint(x: 0, y: 0),
                                                          endPoint: UnitPoint(x: 1, y: 1)
        )
        static  let playerChoiceViewGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.259, green: 0.204, blue: 0.525, opacity: 1),
            Color(.sRGB, red: 0.222, green: 0.023, blue: 0.292, opacity: 1)
        ],
                                                          startPoint: UnitPoint(x: 0, y: 0),
                                                          endPoint: UnitPoint(x: 1, y: 1)
        )
        static  let grayGradient = LinearGradient(colors: [
            Color(.sRGB, red: 0.220, green: 0.220, blue: 0.220, opacity: 1),
            Color(.sRGB, red: 0.220, green: 0.220, blue: 0.220, opacity: 0.4)
        ],
                                                          startPoint: UnitPoint(x: 0, y: 0),
                                                          endPoint: UnitPoint(x: 1, y: 1)
        )
    }
}
