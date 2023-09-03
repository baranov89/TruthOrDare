//
//  ResultItemView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 11.01.2023.
//

import SwiftUI

struct ResultItemView: View {
    @State var user: UserModel
    @State var count: Int

    var body: some View {
        HStack(spacing: 0) {
            Text("\(count)")
                .tdTypo(.body1)
                .padding()
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(user.name)
                    .tdTypo(.body1)
                HStack {
                    Text("\(user.pointsTruth)" + NSLocalizedString(" truth", comment: "") + " | "  + "\(user.pointsDare)" + NSLocalizedString(" dare", comment: ""))
                        .tdTypo(.body7)
                    Spacer()
                    Text(NSLocalizedString("Score", comment: "") + "\(user.pointsDare + user.pointsTruth)")
                        .tdTypo(.body6)
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(count == 1 ? Color.TD.mainViewGradient : Color.TD.grayGradient)
        }
        .background(.black.opacity(0.85))
        .cornerRadius(16)
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(user: UserModel(name: "Alex", pointsTruth: 10, pointsDare: 4), count: 1)
    }
}
