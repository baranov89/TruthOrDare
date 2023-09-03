//
//  CategoriesView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 08.09.2022.
//

import SwiftUI

struct CategoriesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var players: [UserModel]
    @State private var game: GameModel?
    @State private var showChoiceOfMoveNew = false
    @State private var showPaidCategory = false
    @State private var showRulesView = false
    @State private var selectedСategory: CategoryModel?
    private var columns: [GridItem] = [
        GridItem(.fixed(180), spacing: 10),
        GridItem(.fixed(180), spacing: 10)]
    private var freeCategoriesArray: [CategoryModel] = [
        CategoriesMain.best,
        CategoriesMain.fun1]
    private var paidCategoriesArray: [CategoryModel] = [
        CategoriesMain.fun2,
        CategoriesMain.heatParty,
        CategoriesMain.kids,
        CategoriesMain.warmUp,
        CategoriesMain.party,
        CategoriesOver18.adult,
        CategoriesOver18.crazy,
        CategoriesOver18.intimate]

    init(players: [UserModel]) {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "NunitoSans-Light", size: 25) as Any]
        _players = State(initialValue: players)
    }

    var body: some View {
        ZStack {
            Color.TD.categoriesViewGradient
                .ignoresSafeArea()
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(freeCategoriesArray) { item in
                            Button {
                                selectedСategory = item
                                getСategory(selectedСategory: selectedСategory)
                            } label: {
                                CategoryItem(category: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    TdOpenSetsButton(action: {
                    }, text: NSLocalizedString("Open all sets", comment: "categories"), image: "Cards", background: Color.TD.orangeGradient)
                    .padding(.vertical, 10)
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(paidCategoriesArray) { item in
                            Button {
                                selectedСategory = item
                                getСategory(selectedСategory: selectedСategory)
                            } label: {
                                CategoryItem(category: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text("Select kits"))
            .ignoresSafeArea(edges: .bottom)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TdNavbarBackButton {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    TdNavbarButton(image: "Help") {
                        showRulesView.toggle()
                    }
                    .sheet(isPresented: $showRulesView) {
                        RulesView()
                    }
                }
            }
            .background {
                NavigationLink(isActive: $showChoiceOfMoveNew) {
                    ChoiceOfMoveView(game: $game)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    EmptyView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .bottomSheet(isShowing: $showPaidCategory, height: 600, background: Color.white) {
            PaidCategory(category: $selectedСategory)
        }
    }

    func getcountRounds(questions: [String], actions: [String], countUsers: [UserModel]) -> Int {
        var countRounds: Int
        if actions.count >= questions.count {
            countRounds = Int(actions.count/countUsers.count)
        } else {
            countRounds =  Int(questions.count/countUsers.count)
        }
        return countRounds
    }

    func getСategory(selectedСategory: CategoryModel?) {
        if let category = selectedСategory {
            if category.isLock {
                withAnimation {
                    showPaidCategory.toggle()
                }
            } else {
                let countRounds = getcountRounds(questions: category.questions, actions: category.actions, countUsers: players)
                game = GameModel(users: players, round: 1, questions: category.questions, actions: category.actions, currentUser: 0, countRounds: countRounds)
                showChoiceOfMoveNew.toggle()
            }
        }
    }
}

// struct CategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView(players: [UserModel(name: "eqwe", points: 1)])
//    }
// }
