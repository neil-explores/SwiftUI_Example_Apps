//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Neil Thorne on 6/12/25.
//

import SwiftUI
import SwiftData


struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    // passing a reference to the function, not actually calling it
                    //so this works:
                    //.onDelete(perform: deleteMovies)
                    // This also works:
                    //.onDelete(perform: deleteMovies(indexes:)
                    // This works too, long-handed, but more clear (the modifier is passing an array of indexes to delete)
                    .onDelete { indexes in
                        deleteMovies(indexes: indexes)
                    }
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add Movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
         
        

    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
    
}

#Preview {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    MovieList()
        .modelContainer(for: Friend.self, inMemory: true)
}
