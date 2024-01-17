//
//  AddProjectView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 12.01.2024.
//

import SwiftData
import SwiftUI

struct EditProjectView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    var isEditMode: Bool
    @State private var projectName: String = ""
    @State private var showConfirmation = false

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project Name", text: $projectName)
                        .textFieldStyle(.roundedBorder)

                    Button(isEditMode ? "Save" : "Add") {
                        if isEditMode {
                            // Save the new project name
                            project.name = projectName
                        } else {
                            // Add project to SwiftData
                            project.name = projectName
                            context.insert(project)
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                if isEditMode {
                    // Show delete button
                    Button("Delete", action: {
                        // Show confirmation dialog
                        showConfirmation.toggle()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Do you want to delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete it") {
                // Delete project from swiftData
                context.delete(project)
                dismiss()
            }
        }.onAppear {
            projectName = project.name
        }
    }
}
