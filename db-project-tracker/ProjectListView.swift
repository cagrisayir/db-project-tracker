//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 9.01.2024.
//

import SwiftData
import SwiftUI

struct ProjectListView: View {
    @State private var newProject: Project?

    @Query private var projects: [Project]

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HStack {
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    Spacer()
                    Button(action: {
                        // Create new Project
                        self.newProject = Project()
                    }, label: {
                        Image("cross")
                            .padding(10)
                            .background(Color.black)
                            .clipShape(
                                Circle()
                            )

                    })
                }

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 26) {
                        ForEach(projects) { project in
                            ProjectCardView(project: project)
                        }
                    }
                }

            }.padding()
        }
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.3)])
        }
    }
}

#Preview {
    ProjectListView()
}
