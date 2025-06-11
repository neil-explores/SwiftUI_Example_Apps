//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Neil Thorne on 6/11/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            
            Picker("Win Condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle.rect(cornerRadius: 10.0))
    }
}

#Preview {
    // The @Previewable macro lets you use dynamic properties
    // inline in previews.
    // You only use it inside a #Preview body.
    @Previewable @State var startingPoints = 10
    @Previewable @State var doesHighestScoreWin = true
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
