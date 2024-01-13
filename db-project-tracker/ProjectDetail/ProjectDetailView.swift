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

            // LINE
            LinearGradient(colors: [Color("Sky Blue"), Color("Washed Blue").opacity(0)], startPoint: .bottom, endPoint: .top)
                .frame(width: 2)
                .padding(.leading, -150)

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
                    HStack {
                        Image(systemName: "checkmark.square")
                        Text("Design the new website")
                            .font(.featuredText)
                    }
                    .padding(.leading)
                }.foregroundStyle(.white)
                    .padding()
                    .background {
                        Color.black
                            .opacity(0.7)
                            .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                            .ignoresSafeArea()
                    }
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 27) {
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                    }
                    .padding()
                    .padding(.bottom, 100)
                }
            }

            VStack {
                Spacer()

                HStack {
                    Button(action: {
                        // TODO: add project update
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image("cross")
                        }
                    })
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image(systemName: "arrowshape.backward.fill")
                                .foregroundStyle(Color("Orchid"))
                        }
                    })
                }
                .padding()
                .background {
                    Color.black
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
