//
//  SocialMediaButton.swift
//  Games
//
//  Created by Szymon Lorenz on 13/12/20.
//

import TokamakDOM
import JavaScriptKit

enum Social {
    case facebook
    case instagram
    case twitter
    
    var imageUrl: String {
        switch self {
        case .facebook:
            /*
             <a href="https://icons8.com/icon/435/facebook">Facebook icon by Icons8</a>
             */
            return "https://img.icons8.com/ios/50/000000/facebook--v1.png"
        case .instagram:
            /*
             <a href="https://icons8.com/icon/32292/instagram">Instagram icon by Icons8</a>
             */
            return "https://img.icons8.com/ios/50/000000/instagram-new--v1.png"
        case .twitter:
            /*
             <a href="https://icons8.com/icon/107615/twitter-squared">Twitter Squared icon by Icons8</a>
             */
            return "https://img.icons8.com/ios/50/000000/twitter-squared.png"
        }
    }
}

struct SocialMediaButton: View {
    let link: String
    let type: Social
    
    var body: some View {
        socialMediaButton(link, image: type.imageUrl)
    }
    
    private func socialMediaButton(_ url: String, image: String) -> some View {
        TapGesture(action: {
            _ = JSObject.global.window.open("\(url)")
        }) {
            WebImage(image)
                .background(Color.white)
                .cornerRadius(8)
        }.padding()
    }
}
