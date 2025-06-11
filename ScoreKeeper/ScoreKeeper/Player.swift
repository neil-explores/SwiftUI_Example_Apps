//
//  Player.swift
//  ScoreKeeper
//
//  Created by Neil Thorne on 6/10/25.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    
    var name: String
    var score: Int
}

extension Player: Equatable {
    // lhs == "left hand side"
    // rhs == "right hand side"
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
