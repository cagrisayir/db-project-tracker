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

                TextField("Summary", text: $summary)
                    .textFieldStyle(.roundedBorder)

                HStack {
                    TextField("Hours", text: $hours)
                        .textFieldStyle(.roundedBorder)

                    Button("Save") {
                        // TODO: Save project to SwiftData
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
