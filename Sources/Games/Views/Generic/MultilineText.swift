//
//  MultilineText.swift
//  Games
//
//  Created by Szymon Lorenz on 13/12/20.
//

import TokamakDOM

struct MultilineText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HTML("div", [ "class": "multiline",
                      "style": "white-space: pre-wrap;"]) {
            Text(text)
        }
    }
}
