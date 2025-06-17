//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by Neil Thorne on 6/16/25.
//

import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if the tiles are alphabetized
        // THIS IS KEY TO SORTING AND HOW IT IS CHECKED IF THEY ARE IN ORDER!!!!
        // It is sorting them by their x position!
        let userSortedtiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        // NOTE: I like this syntax better, but commenting it out
//        let userSortedtiles = tiles.sorted { lhs, rhs in
//            lhs.position.x < rhs.position.x
//        }
        
        // You are sorting via seeing if one word comes before the other in a a dictionary Book (think: looking the word up in a dictionary).
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        let isAlphabetized = userSortedtiles == alphabeticallySortedTiles

        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedtiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        
        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            if isAlphabetized {
                //tiles.removeAll()
                startNewGame()
            }
            
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            
            // Display instructions
            message = .instructions
        }

    }
    
    // MARK: private implementation
    
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
// I like a recognizable loop
//            for index in 0..<tileCount {
//                let tile = tiles[index]
//                let word = newWords[index]
//                tile.word = word
//            }
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }

    }
}
