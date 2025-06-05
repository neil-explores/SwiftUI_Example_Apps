//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Neil Thorne on 5/28/25.
//
// icons are caled "SF Symbols" and there are over 6,000
//      The icons can be modified a bunch, and even animated.


import SwiftUI

struct ContentView: View {

    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]


    @State private var selected = "Baseball"
    @State private var id = 1

    var body: some View {
        
        VStack {
            Text("Why not try...")
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                            .symbolEffect(.breathe,
                                          options:SymbolEffectOptions.speed(2).repeat(3)
                                         )
                    )
                Text("\(selected)!")
                    .font(.title)

            } // inner VStack
            // We are attaching an IDENTIFIER to this ENTIRE VStack!
            // Since the entire VStack is changing (via the ID) the animation
            // Needs to update the entire VStack with that transition
            .transition(.slide)
            .id(id)
            Spacer()
            Button("Try again") {
                // The change moves between the views with slide
                withAnimation(.easeIn(duration: 0.5)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
                // change Activity
            }
            .buttonStyle(.borderedProminent)
            
            

        }
        
    }
}


#Preview {
    ContentView()
}
