//
//  ProjectDetailsView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM
import JavaScriptKit

struct ProjectDetailsView: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(project.name)
                .font(.title)
            Spacer().frame(height: 40)
            MultilineText(project.description)
                .frame(maxWidth: 500)
            Spacer().frame(height: 22)
            HStack {
                /*
                 <a href="https://icons8.com/icon/107615/twitter-squared">Twitter Squared icon by Icons8</a>
                 */
                if let url = project.twitter {
                    Button(action: {
                        _ = JSObject.global.window.open("\(url)");
                    }) { WebImage("https://img.icons8.com/ios/50/000000/twitter-squared.png") }
                }
                /*
                 <a href="https://icons8.com/icon/435/facebook">Facebook icon by Icons8</a>
                 */
                if let url = project.facebook {
                    Button(action: {
                        _ = JSObject.global.window.open("\(url)");
                    }) { WebImage("https://img.icons8.com/ios/50/000000/facebook--v1.png") }
                }
                /*
                 <a href="https://icons8.com/icon/32292/instagram">Instagram icon by Icons8</a>
                 */
                if let url = project.instagram {
                    Button(action: {
                        _ = JSObject.global.window.open("\(url)");
                    }) { WebImage("https://img.icons8.com/ios/50/000000/instagram-new--v1.png") }
                }
                Spacer(minLength: 0)
                AppStoreDownload(project: project)
            }.padding(.leading, 40)
            Spacer().frame(height: 22)
            if let url = project.youtube {
                YouTube(url: url)
            }
        }
    }
}
