//
//  NavigationBar.swift
//  Games
//
//  Created by Szymon Lorenz on 6/1/21.
//

import TokamakDOM

struct NavigationBar: View {
    @EnvironmentObject private var coordinator: RootCoordinator

    var body: some View {
        HStack {
            TapGesture(action: {
                coordinator.performAction(.goTo(""))
            }) {
                Text("Fat Sandwich Games")
                    .padding(.all, 8)
                    .border(Color.white, width: 1)
            }
            Spacer()
        }
    }
}
