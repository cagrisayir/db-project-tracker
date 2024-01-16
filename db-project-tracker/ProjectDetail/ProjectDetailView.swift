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
    @State private var update: ProjectUpdate?
    @State private var showEditFocus = false

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
                        if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            Button(action: {
                                // Complete this milestone
                                completeMilestone()
                            }, label: {
                                Image(systemName: "checkmark.square")
                            })
                        }
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                // Display the edit focus form
                                showEditFocus.toggle()
                            }
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
                        ForEach(project.updates.sorted(by: { u1, u2 in
                            u1.date > u2.date
                        })) { update in
                            ProjectUpdateView(update: update)
                        }
                    }
                    .padding()
                    .padding(.bottom, 100)
                }
            }

            VStack {
                Spacer()

                HStack {
                    Button(action: {
                        // Add project update
                        self.update = ProjectUpdate()
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
            .sheet(item: $update) { update in
                AddUpdateView(project: project, update: update)
                    .presentationDetents([.fraction(0.5)])
            }
            .sheet(isPresented: $showEditFocus, content: {
                EditFocusView(project: project)
                    .presentationDetents([.fraction(0.2)])
            })
    }

    func completeMilestone() {
        // Create a new project update for milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achieved"
        update.summary = project.focus
        project.updates.insert(update, at: 0)
        // clear the project focus
        project.focus = ""
    }
}
