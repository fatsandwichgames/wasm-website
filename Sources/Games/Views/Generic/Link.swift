//
//  Link.swift
//  Games
//
//  Created by Szymon Lorenz on 7/1/21.
//

import TokamakDOM

struct Link: View {
    let label: String
    let url: String

    init(label: String, url: String) {
        self.url = url
        self.label = label
    }
    
    init(url: String) {
        self.init(label: url, url: url)
    }
    
    var body: some View {
        AnyView(HTML("a", ["href": url, "target": "_blank", "style": "font-size:13px"]) {
            Text(label).foregroundColor(.blue)
        })
    }
}
