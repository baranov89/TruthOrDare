//
//  BottomSheet.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 18.09.2022.
//

import SwiftUI
struct BottomSheet<LabelContent: View, T: View>: ViewModifier {

    @Binding var isShowing: Bool
    var height: CGFloat
    var background: T
    var label: () -> LabelContent

    public func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            Group {
                if isShowing {
                    ZStack {
                        background.ignoresSafeArea(.all)
                        VStack(spacing: 0) {
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation {
                                        isShowing.toggle()
                                    }
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                .buttonStyle(.plain)
                                .padding()
                            }
                            label()
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: height, alignment: .center)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .transition(.move(edge: .bottom))
                }
            }
            .zIndex(2.0)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

 extension View {
     func bottomSheet<LabelContent: View, T: View>(isShowing: Binding<Bool>, height: CGFloat, background: T, label: @escaping () -> LabelContent) -> some View {
         modifier(BottomSheet<LabelContent, T>(isShowing: isShowing, height: height, background: background, label: label))
    }
 }
