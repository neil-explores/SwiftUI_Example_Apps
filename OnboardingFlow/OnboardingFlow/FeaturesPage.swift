//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Neil Thorne on 6/4/25.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short Summary")
            
            Spacer()
                
        }
        .padding()
        
    }
}

#Preview {
    // We apply these modifiers because it inherits these modifiers by the parent view
    // this is important to notice when you put modifiers on parent views
    // modifiers can be overridden in child views
    FeaturesPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}
