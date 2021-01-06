//
//  ProjectDetailsView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectDetailsView: View {
    let coordinator: Coordinator
    
    let project: Project
    
    var hasTwitter: Bool {
        project.twitter != nil
    }
    
    var hasFacebook: Bool {
        project.facebook != nil
    }
    
    var hasInstagram: Bool {
        project.instagram != nil
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(project.name)
                    .font(.title)
                Spacer()
                privacyPolicy(name: project.name)
                termsOfUse(name: project.name)
            }.frame(minHeight: 100)
            Spacer().frame(height: 40)
            MultilineText(project.description)
//                .frame(minWidth: 500)
//                .frame(width: 500)
            Spacer().frame(height: 22)
            HStack {
                AppStoreDownload(project: project)
                Spacer()
                if hasTwitter {
                    SocialMediaButton(link: project.twitter ?? "", type: .twitter)
                }
                if hasFacebook {
                    SocialMediaButton(link: project.facebook ?? "", type: .facebook)
                }
                if hasInstagram {
                    SocialMediaButton(link: project.instagram ?? "", type: .instagram)
                }
            }.padding(.leading, 40)
            Spacer().frame(height: 22)
            if let url = project.youtube {
                YouTube(url: url)
            }
        }
    }
    
    private func privacyPolicy(name: String) -> some View {
        /*
         <a href="https://icons8.com/icon/123365/terms-and-conditions">Terms and Conditions icon by Icons8</a>
         */
        TapGesture(action: {
            coordinator.performAction(.goTo("privacy-policy/\(name)"))
        }) {
            WebImage("https://img.icons8.com/ios/50/000000/terms-and-conditions.png")
                .background(Color.white)
                .cornerRadius(8)
        }
        .padding()
    }
    
    private func termsOfUse(name: String) -> some View {
        /*
         <a href="https://icons8.com/icon/YqMviGkCsvoB/security-shield-green">Security Shield Green icon by Icons8</a>
         */
        TapGesture(action: {
            coordinator.performAction(.goTo("terms-of-use/\(name)"))
        }) {
            WebImage("https://img.icons8.com/ios/50/000000/security-shield-green.png")
                .background(Color.white)
                .cornerRadius(8)
        }
        .padding()
    }
}
