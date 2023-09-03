//
//  CircularActivityIndicator.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 18.09.2022.
//

import SwiftUI

struct TdActivityIndicator: View {
    @State private var degrees = -360.0
    let color: Color
    var size: CGFloat = 100
    var thickness: CGFloat = 4

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(color, lineWidth: thickness)
                .frame(width: size)
                .rotationEffect(.degrees(degrees), anchor: .center)
        }
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                degrees = 0.0
            }
        }
    }
}
