//
//  View+extention.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Active binding
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        ZStack {
            self
            NavigationLink(destination: view, isActive: binding) { EmptyView() }
        }
    }
}
