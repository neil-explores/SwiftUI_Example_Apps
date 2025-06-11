//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Neil Thorne on 6/11/25.
//

import Testing
// This essentially imports your app
// Remember: your test product is SEPEREATE from your app product
//
// Normally, internal types and methods in your app aren’t accessible from outside it. However, because ScoreKeeperTests was built specifically for testing, you can access an app’s internal methods as long as you import the app with the @testable annotation.
@testable import ScoreKeeper

struct ScoreKeeperTests {

    // You are wrapping your model around a function with a bunch of values to test via the arguments...
    // The function can be named whatever you want: it doesn't have to match the key function you are testing.
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andrew", score: 5)
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest Score Wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andrew", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andrew", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andrew", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
    
    @Test("Tied Players of win condition win")
    func tiedPlayersAllWin() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 2),
                Player(name: "Andrew", score: 2)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners.contains(Player(name: "Elisha", score: 2)))
        #expect(winners.contains(Player(name: "Andrewg", score: 2)))
    }
    

}
