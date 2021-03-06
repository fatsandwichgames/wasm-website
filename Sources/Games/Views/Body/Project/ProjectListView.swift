//
//  ProjectListView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectListView: View {
    let coordinator: Coordinator
    
    let projects: [Project]
    let activeProjectId: String?
    
    let columns = [
        GridItem(.fixed(200)),
    ]
     
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(projects) { project in
                        TapGesture(action: {
                            coordinator.performAction(.goTo("game/\(project.id)"))
                        }) {
                            ProjectView(project: project, isActive: activeProjectId == project.id)
                        }
                    }
                }
                Spacer(minLength: 40)
                VStack {
                    if activeProjectId != nil {
                        ProjectDetailsView(coordinator: coordinator, project: projects.first(where: { $0.id == activeProjectId })!)
                    }
                }.frame(width: 600)
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 50)
    }
}
