//
//  ProjectDetailView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 12.01.2024.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss

    var project: Project

    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)

            Button("Back") {
                // Navigate back
                dismiss()
            }
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
