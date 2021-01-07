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
                    .padding(.leading, 8)
            }
            Spacer()
                .frame(minWidth: 400)
            SocialMediaButton(link: "https://www.facebook.com/fatsandwichgames/", type: .facebook)
            SocialMediaButton(link: "https://www.instagram.com/fatsandwichgames/", type: .instagram)
        }
        .border(Color.white, width: 1)
        .padding(.top, 12)
    }
}
