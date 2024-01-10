//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 9.01.2024.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.bigHeadline)
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
