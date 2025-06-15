//
//  FriendsFavoriteMoviesApp.swift
//  FriendsFavoriteMovies
//
//  Created by Neil Thorne on 6/12/25.
//

import SwiftUI

@main
struct FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // When launching the app, we are saying: setup the Connection of SwiftData to these two models
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
