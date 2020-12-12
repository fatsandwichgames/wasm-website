//
//  ProjectListView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ProjectListView: View {
    @StateObject private var hashState = HashState()
    var projects: [Project]
    
    var activeProjectId: String? {
        guard let slice = location?.description.split(separator: "#").last else {
            return nil
        }
        return String(slice)
    }
    
    let columns = [
        GridItem(.fixed(200)),
    ]
     
    var body: some View {
        VStack {
            HStack {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(projects) { project in
                            TapGesture(action: {
                                location?.hash = .string("\(project.id)")
                            }) {
                                ProjectView(project: project)
                            }
                        }
                    }
                }
                if activeProjectId != nil {
                    ProjectDetailsView(project: projects.first(where: { $0.id == activeProjectId })!)
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 50)
    }
}
