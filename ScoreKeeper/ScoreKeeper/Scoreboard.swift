//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Neil Thorne on 6/11/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        return players.filter { player in
            player.score == winningScore
        }
    }
    
    mutating func resetScores(to newValue: Int) {
        // NOTE: THIS WOULDN'T WORK FOR THE BODY because each `player` written this way is a COPY and not the original
        // Compiler protects you wtih this message: "Cannot assign to property: 'player' is a 'let' constant"
        // This WOULD work however: if it was a class
        // for player in players {
        //    player.score = newValue
        // }
        
        // You need to do it this way because you are working with a Struct
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
