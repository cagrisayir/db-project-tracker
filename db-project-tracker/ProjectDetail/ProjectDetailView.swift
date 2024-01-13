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
        ZStack {
            LinearGradient(colors: [Color("Navy"), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                VStack(alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)

                    HStack(alignment: .center, spacing: 13) {
                        Spacer()
                        StatBubbleView(title: "Hours", stat: "290")
                        StatBubbleView(title: "Sessions", stat: "34", startColor: Color("Turtle Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor: Color("Fuschia"))
                        StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                    }
                    Text("My current focus is...")
                        .font(.featuredText)
                    Text("Design the new website")
                        .font(.featuredText)
                    Button("Back") {
                        // Navigate back
                        dismiss()
                    }
                }.foregroundStyle(.white)
                    .padding()
                    .background {
                        Color.black
                            .opacity(0.7)
                            .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                    }
                ScrollView {
                    VStack {
//                        ForEach(project.updates) { update in
//
//                        }

                        ZStack {
                            Rectangle()
                                .foregroundStyle(.black)
                            VStack {
                                HStack {
                                    Text("Thursday, September 12, 2024")
                                    Spacer()
                                    Text("9 Hours")
                                }
                                .background {
                                    Color("Orchid")
                                }
                                Text("Project headline")
                                    .font(.smallHeadline)
                                Text("Project summary")
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
