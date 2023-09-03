//
//  UserItemView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 03.09.2022.
//

import SwiftUI

struct UserItemView: View {
    @Binding var user: UserModel
    @Binding var data: [UserModel]
    var index: Int

    var body: some View {
        HStack {
            Image("GameController")
                .padding()
            TextField(NSLocalizedString("Player ", comment: "") + String(index + 1), text: $user.name)
                .tdTypo(.body2, color: .black)
            Spacer()
            if index > 1 {
                Button {
                    removeUser(index: index)
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .frame(width: 30, height: 30)
                        .cornerRadius(12)
                        .padding(.trailing)

                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 68)
        .background(.white)
        .cornerRadius(16)
    }

    func removeUser(index: Int) {
            data.remove(at: index)
   }
}

// struct UserItemView_Previews: PreviewProvider {
//     static var previews: some View {
//         UserItemView(user: .constant(UserModel()), index: 0)
//     }
// }
