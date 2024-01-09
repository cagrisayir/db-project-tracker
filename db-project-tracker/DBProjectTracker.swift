//
//  db_project_trackerApp.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 9.01.2024.
//

import SwiftUI
import SwiftData

@main
struct DBProjectTracker: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
