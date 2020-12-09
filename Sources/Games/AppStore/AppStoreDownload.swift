//
//  AppStoreDownload.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct AppStoreDownload: View {
    let project: Project
    
    var body: some View {
        HTML("a", [
            "href": project.appStoreUrl,
            "style": "display: inline-block; overflow: hidden; border-top-left-radius: 13px; border-top-right-radius: 13px; border-bottom-right-radius: 13px; border-bottom-left-radius: 13px; width: 250px; height: 83px;",
        ]) {
            HTML("img", [
                "src": "https://tools.applemediaservices.com/api/badges/download-on-the-app-store/white/en-US?size=250x83&amp;releaseDate=1607212800&h=32456d2da0ebe2339cadfb0e00b33037",
                "alt": "Download on the App Store",
                "style": "border-top-left-radius: 13px; border-top-right-radius: 13px; border-bottom-right-radius: 13px; border-bottom-left-radius: 13px; width: 250px; height: 83px;",
            ])
        }
    }
}
