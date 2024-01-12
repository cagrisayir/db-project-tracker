//
//  ProjectCardView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 11.01.2024.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)

            VStack(alignment: .leading, spacing: 10) {
                Text(project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)

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
