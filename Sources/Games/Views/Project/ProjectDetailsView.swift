//
//  ProjectDetailsView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectDetailsView: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .trailing) {
            AppStoreDownload(project: project)
            Spacer().frame(height: 22)
            if let url = project.youtube {
                YouTube(url: url)
            }
        }
    }
}
