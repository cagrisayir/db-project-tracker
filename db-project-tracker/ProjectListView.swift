//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 9.01.2024.
//

import SwiftUI

struct ProjectListView: View {
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
                        ProjectCardView()
                        ProjectCardView()
                    }
                }

            }.padding()
        }
    }
}

#Preview {
    ProjectListView()
}
