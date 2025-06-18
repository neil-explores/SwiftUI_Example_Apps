//
//  PredictionView.swift
//  TrailAnalyzer
//
//  Created by Neil Thorne on 6/18/25.
//

import SwiftUI

struct PredictionView: View {
    @State var predictedRisk: Risk
    
    var body: some View {
        VStack {
            RiskCard(risk: predictedRisk)
            Spacer()
        }
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    riskSummaryView
                } label: {
                    Image(systemName: "info.circle")
                }

            }
        }
        .trailTheme()
    }
    
    var riskSummaryView: some View {
        ScrollView {
            ForEach(Risk.allCases) {
                RiskCard(risk: $0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PredictionView(predictedRisk: .moderate)
    }
    
}
