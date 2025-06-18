//
//  TrailField.swift
//  TrailAnalyzer
//
//  Created by Neil Thorne on 6/17/25.
//

import SwiftUI


struct TrailField<Content: View>: View {
    var iconName: String
    var label: String
    // let you provide a parameter as a closure! Syntatic sugar!
    @ViewBuilder var content: Content


    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .foregroundStyle(Color.trailTheme)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            Text(label)
            Spacer()
            content
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(.white, in: RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    TrailField(iconName: "figure.hiking", label: "Label") {
        Text("Content")
    }
    .trailTheme()
}
