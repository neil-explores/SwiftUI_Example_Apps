//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Neil Thorne on 6/3/25.
//


// .border(.black, width: 1.5) is a great debugging way to see the container of a particular view: where it's edges are.

// Spacer() is a great way to fill up the space: "expand as much as possible to fill empty space in the DIRECTION OF THEIR CONTAINING STACK"

// TabView [...] .tabViewStyle(.page) Swipeing between views


import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {

        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
