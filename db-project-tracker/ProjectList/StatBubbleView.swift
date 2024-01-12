//
//  StatBubbleView.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 11.01.2024.
//

import SwiftUI

struct StatBubbleView: View {
    var title: String = "Hours"
    var stat: String = "290"
    var startColor = Color("Navy")
    var endColor = Color("Sky Blue")

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                )

            VStack {
                Text(title)
                    .font(.captionText)
                Text(stat)
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView()
}
