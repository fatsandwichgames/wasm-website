//
//  NavigationBar.swift
//  Games
//
//  Created by Szymon Lorenz on 6/1/21.
//

import TokamakDOM

struct NavigationBar: View {
    let coordinator: Coordinator

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
                .frame(minWidth: 400)
        }
        .padding(.top, 12)
        Rectangle().fill(Color.red).frame(width: 20, height: 20)
    }
}
