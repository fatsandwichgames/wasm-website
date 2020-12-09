//
//  ContentView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ContentView: View {
    var body: some View {
        ProjectListView(
            projects :
                [
                    Project(id: "id1510216500",
                            name: "Little Wars",
                            appStoreUrl: "https://apps.apple.com/app/little-wars-with-big-battles/id1510216500",
                            thumbnailUrl: "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/30/83/51/30835110-a35c-d93c-4aeb-38a402328fa5/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/540x540bb.jpg",
                            youtube: "https://www.youtube.com/embed/zB6TeBg0t2Q"),
                    Project(id: "id1542765652",
                            name: "Ho Ho Go",
                            appStoreUrl: "https://apps.apple.com/app/ho-ho-go/id1542765652",
                            thumbnailUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple114/v4/78/9b/be/789bbefa-d3eb-a877-cea2-68f7be26601d/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/540x540bb.jpg"),
                ]
        )
    }
}
