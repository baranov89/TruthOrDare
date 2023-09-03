//
//  MainView.swift
//  TruthOrDare
//
//  Created by Алексей Баранов on 29.08.2022.
//

import SwiftUI

struct MainView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
    }

    @State private var data: [UserModel] = [UserModel(name: "", pointsTruth: 0, pointsDare: 0), UserModel(name: "", pointsTruth: 0, pointsDare: 0)]
    @State private var showSettingView = false
    @State private var showRulesView = false
    @State private var showCategoriesView = false
    @State private var changeData = false
    @State private var canStart = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack {
                Color.TD.mainViewGradient
                    .ignoresSafeArea()
                VStack {
                    Text(NSLocalizedString("Truth or Dare", comment: ""))
                        .tdTypo(.title2, color: .white)
                        .padding(.vertical)
                        .multilineTextAlignment(.center)
                    ScrollViewReader(content: { proxy in
                        VStack(spacing: 0) {
                            ScrollView {
                                ForEach(data.indices, id: \.self) { index in
                                    if index < data.count {
                                        UserItemView(user: $data[index], data: $data, index: index)
                                            .id(index)
                                    }
                                }
                                .listRowBackground(Color.clear)
                                .frame(maxWidth: .infinity)
                            }
                            .onChange(of: changeData, perform: { _ in
                                withAnimation {
                                    proxy.scrollTo(data.count - 1, anchor: .top)
                                }
                            })
                        }
                        .padding(.horizontal)
                    })
                    Button {
                        if data.count < 10 {
                            data.append(UserModel(name: "", pointsTruth: 0, pointsDare: 0))
                            changeData.toggle()
                        }
                    } label: {
                        HStack {
                            Image("PlusPlayer")
                            Text(NSLocalizedString("Add player", comment: ""))
                                .tdTypo(.body2, color: .white)
                        }
                        .frame(maxWidth: .infinity, minHeight: 68, alignment: .center)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(16)
                        .padding([.horizontal, .top])
                    }
                    .buttonStyle(.plain)
                    Spacer()
                    TdActionButton(title: canStart ? NSLocalizedString("Start the fun ", comment: "") + "\u{2794}" : NSLocalizedString("Fill in all the names", comment: ""), background: canStart ? Color.TD.orangeGradient : Color.TD.grayGradient) {
                        for user in data {
                            if user.name == "" {
                                canStart = false
                                break
                            } else {
                                canStart = true
                            }
                        }
                        if canStart {
                            showCategoriesView.toggle()
                        }
                    }
                    .padding()
                    HStack(spacing: 20) {
                        TdNavbarButton(image: "Star") {}
                        TdNavbarButton(image: "Message") {}
                        TdNavbarButton(image: "Share") {}
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TdNavbarButton(image: "Gear") {
                        showSettingView.toggle()
                    }
                    .sheet(isPresented: $showSettingView) {
                        SettingsView()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    TdNavbarButton(image: "Help") {
                        showRulesView.toggle()
                    }
                    .sheet(isPresented: $showRulesView) {
                        RulesView()
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigateTD(to: CategoriesView(players: data).navigationBarBackButtonHidden(true), when: $showCategoriesView)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onReceive(timer) { _ in
            for user in data {
                if user.name == "" {
                    canStart = false
                    break
                } else {
                    canStart = true
                }
            }
        }
    }

    private func removeUser(index: Int) {
        data.remove(at: index)
    }
}

extension View {
    func navigateTD<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        ZStack {
            self
            NavigationLink(
                destination: view,
                isActive: binding
            ) {
                EmptyView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
