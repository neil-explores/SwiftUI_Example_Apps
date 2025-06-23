//
//  Hike.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/20/25.
//

import Foundation

// Why specify hashable
// Using ForEach in SwiftUI with a struct and id: \.self
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]


    static var formatter = LengthFormatter()


    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }


    struct Observation: Codable, Hashable {
        var distanceFromStart: Double


        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
