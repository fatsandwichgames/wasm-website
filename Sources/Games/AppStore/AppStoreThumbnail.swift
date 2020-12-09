//
//  AppStoreThumbnail.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct AppStoreThumbnail: View {
    let project: Project
    
    var body: some View {
        HTML("img", [
            "src": project.thumbnailUrl,
            "alt": project.name,
            "style": "width: 170px; height: 170px; border-top-left-radius: 22%; border-top-right-radius: 22%; border-bottom-right-radius: 22%; border-bottom-left-radius: 22%; overflow: hidden; display: inline-block; vertical-align: middle;",
        ])
    }
}
