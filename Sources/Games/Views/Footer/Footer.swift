//
//  Footer.swift
//  Games
//
//  Created by Szymon Lorenz on 6/1/21.
//

import TokamakDOM

struct Footer: View {
    var body: some View {
        HStack {
            FooterNote(note: "game assets:", urlLabel: "Unity Assetstore", url: "https://assetstore.unity.com")
            Spacer()
            FooterNote(note: "site icons:", urlLabel: "icons8", url: "https://icons8.com")
        }
        VStack {
            Text("2021 Fat Sandwich Games")
                .padding(.bottom, 12)
        }
    }
}

private struct FooterNote: View {
    let note: String
    let urlLabel: String
    let url: String

    var body: some View {
        HStack {
            Text(note)
                .font(.footnote)
            Spacer().frame(width: 4)
            Link(label: urlLabel, url: url)
        }
    }
}
