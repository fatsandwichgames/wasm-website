//
//  ProjectView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectView: View {
    let project: Project
    let isActive: Bool
    
    var body: some View {
        VStack {
            AppStoreThumbnail(project: project)
                .padding(isActive ? 4 : 0)
                .border(Color.white, width: isActive ? 4 : 0)
            Spacer().frame(height: 8)
            Text(project.name)
                .frame(height: 50)
                .frame(maxWidth: 200)
        }
    }
}
