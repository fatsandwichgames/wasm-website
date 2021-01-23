//
//  GHSponsor.swift
//  COpenCombineHelpers
//
//  Created by Szymon Lorenz on 23/1/21.
//

import Foundation
import TokamakDOM

struct GHSponsor: View {
    var body: some View {
        HTML("iframe", [
            "width": "116",
            "height": "35",
            "src": "https://github.com/sponsors/shial4/button",
            "title": "Sponsor Szymon",
            "style": "border: 0;",
        ])
    }
}
