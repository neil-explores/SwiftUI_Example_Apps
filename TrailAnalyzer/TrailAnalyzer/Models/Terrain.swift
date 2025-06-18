//
//  Terrain.swift
//  TrailAnalyzer
//
//  Created by Neil Thorne on 6/17/25.
//

import Foundation

enum Terrain: String, Identifiable, CaseIterable {
    case paved
    case dirt
    case rocky
    case sandy
    
    var id: String {
        rawValue
    }
}
