//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 15.01.2024.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool

    @State private var headline = ""
    @State private var summary = ""
    @State private var hours = ""
    @State private var showConfirmation = false

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Update" : "New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)

                TextField("Headline", text: $headline)
                    .textFieldStyle(.roundedBorder)

                TextField("Summary", text: $summary, axis: .vertical)
                    .textFieldStyle(.roundedBorder)

                HStack {
                    TextField("Hours", text: $hours)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 60)

                    Button(isEditMode ? "Save" : "Add") {
                        update.headline = headline
                        update.project = project
                        update.summary = summary
                        update.hours = Double(hours)!

                        if !isEditMode {
                            // Add Project update
                            project.updates.insert(update, at: 0)
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)

                    if isEditMode {
                        Button("Delete") {
                            // Show confirmation dialog
                            showConfirmation.toggle()
                        }.buttonStyle(.borderedProminent)
                            .tint(.red)
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Are you sure to delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete it.") {
                project.updates.removeAll { u in
                    u.id == update.id
                }
                dismiss()
            }
        }
        .onAppear {
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
}
