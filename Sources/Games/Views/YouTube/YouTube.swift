//
//  YouTube.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct YouTube: View {
    let url: String
    
    var body: some View {
        HTML("iframe", [
            "width": "560",
            "height": "315",
            "src": url,
            "frameborder": "0",
            "allow": "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
        ])
    }
}
