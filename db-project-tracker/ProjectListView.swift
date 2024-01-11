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
                Text("Projects")
                    .font(.screenHeading)
                    .foregroundStyle(.white)

                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 15)
                                .opacity(0.7)
                                .shadow(radius: 5, x: 0, y: 4)

                            VStack(alignment: .leading, spacing: 10) {
                                Text("Code With Omer")
                                    .font(.bigHeadline)
                                    .foregroundStyle(.white)

                                HStack(alignment: .center) {
                                    StatBubbleView()
                                    StatBubbleView(title: "Sessions", stat: "34")
                                    StatBubbleView()
                                    StatBubbleView()
                                }

                                Text("My current focus is...")
                                    .font(.featuredText)
                                    .foregroundStyle(Color.gray)

                                Text("Design the new website")
                                    .font(.featuredText)
                                    .foregroundStyle(Color.gray)
                                    .bold()
                            }
                            .padding()
                        }
                    }
                }

                Button(action: {
                }, label: {
                    Image("cross")
                        .padding(10)
                        .background(Color.black)
                        .clipShape(
                            Circle()
                        )

                })
            }.padding()
        }
    }
}

#Preview {
    ProjectListView()
}
