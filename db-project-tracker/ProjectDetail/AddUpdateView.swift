//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 15.01.2024.
//

import SwiftUI

struct AddUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var project: Project
    var update: ProjectUpdate
    @State var headline = ""
    @State var summary = ""
    @State var hours = ""

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text("New Update")
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

                    Button("Save") {
                        // Save project to SwiftData
                        update.headline = headline
                        update.project = project
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.append(update)

                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
