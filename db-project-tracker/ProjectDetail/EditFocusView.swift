//
//  EditFocusView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 16.01.2024.
//

import SwiftUI

struct EditFocusView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    @State var focus: String = ""

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)

                    Button("Save") {
                        // TODO: Save the focus of the project to SwiftData
                        project.focus = focus
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
