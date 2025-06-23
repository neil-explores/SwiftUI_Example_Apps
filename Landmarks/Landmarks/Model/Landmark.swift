//
//  Landmark.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/19/25.
//

import Foundation
import SwiftUI
import CoreLocation

// Adding Codable conformance makes it easier to move data between the structure and a data file.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    // This could be a string, but instead we want it to be an enum because it is a mutually exclusive string from a list
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    // type `Image` requires `import SwiftUI`
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    // Notice how this is nested inside Landmark
    // This is because this is how the JSON is organized: Coordinates is another JSON object.
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
