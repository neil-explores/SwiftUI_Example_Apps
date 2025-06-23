//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/19/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
