//
//  ModelData.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/19/25.
//

import Foundation

@Observable
class ModelData {
    // This shows how you can take a JSON file and load it into an array in Swift
    // The Swift compiler knows it is making an array of `Landmarks`
    // Landmark conforms to `Codable` which means it also conforms to `Decodable`
    // So ultimately: that generic of `T` is a standin for `Landmark`, and it is happy because Landmark does indeed conform to `Decodable`
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter {$0.isFeatured}
    }
    
    // returns a dictionary: the landmarks are grouped by the category name
    // grouping: What collection are we creating dictionary sets of (the array of Landmarks)
    // by: What is the key? How are we clustering this collection (by the items' category.rawValue)
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}


// This is a pattern for how to load JSON into ModelData...
// The generic "T" is the struct `Landmark`
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
