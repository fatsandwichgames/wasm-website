//
//  ProjectView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectView: View {
    let project: Project
    
    var body: some View {
        VStack {
            AppStoreThumbnail(project: project)
            Spacer().frame(height: 8)
            Text(project.name)
                .frame(height: 50)
                .frame(maxWidth: 200)
        }
    }
}
