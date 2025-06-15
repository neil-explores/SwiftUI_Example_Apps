//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Neil Thorne on 6/12/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie?
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Elena"),
        Friend(name: "Graham"),
        Friend(name: "Mayuri"),
        Friend(name: "Rick"),
        Friend(name: "Rody")
    ]
}
