//
//  UINavigationBar+extention.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import UIKit

extension UINavigationBar {
    func setNavigationBarColor(titleColor: UIColor, backgroundColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
