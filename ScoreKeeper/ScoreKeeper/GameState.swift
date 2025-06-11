//
//  GameState.swift
//  ScoreKeeper
//
//  Created by Neil Thorne on 6/11/25.
//

import Foundation

// define a common type for a group of relatd but MUTUALLY EXCLUSIVE values (can only be one)
enum GameState {
    case setup
    case playing
    case gameOver
}
