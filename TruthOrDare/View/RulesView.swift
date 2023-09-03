//
//  rules.swift
//  TruthOrDare
//
//  Created by Андрей Костицин on 04.09.2022.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.dismiss) private var dismiss
    private let sentences = [(number: 1, text: NSLocalizedString("Choose - truth or action", comment: "")),
                             (number: 2, text: NSLocalizedString("Earn points by answering questions honestly or completing a task", comment: "")),
                             (number: 3, text: NSLocalizedString("If you don't want to answer a question or complete a task, give up, but you will lose points at the same time", comment: ""))]
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Spacer()
            Text("Rules")
                .tdTypo(.title2)
            ForEach(sentences, id: \.0) { item in
                HStack {
                    ZStack {
                        Text("\(item.number)")
                            .padding()
                            .background(.red)
                            .tdTypo(.body3, color: .white)
                            .clipShape(Circle())
                    }
                    Text(item.text)
                }
            }
            Spacer()
            TdActionButton(title: NSLocalizedString("Close", comment: ""), background: Color.TD.orangeGradient, action: {
                dismiss()
            })
        }
        .padding()
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
            .previewInterfaceOrientation(.portrait)
    }
}
