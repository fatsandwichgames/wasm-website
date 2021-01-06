//
//  WebImage.swift
//  Games
//
//  Created by Szymon Lorenz on 13/12/20.
//

import TokamakDOM

struct WebImage: View {
    let url: String
    
    init(_ url: String) {
        self.url = url
    }
    
    var body: some View {
        HTML("img", ["src":"\(url)"])
    }
}
