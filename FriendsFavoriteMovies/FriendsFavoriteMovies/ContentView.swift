//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Neil Thorne on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }
            
            Tab("Movies", systemImage: "film.stack") {
                FilteredMovieList()
            }
        }
        
    }
}

// NOTE: your sample data is only linked to the previews!!!
#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}


#Preview("In memory") {
    ContentView()
        .modelContainer(for: [Friend.self, Movie.self], inMemory: true)
}

