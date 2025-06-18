//
//  TrailAnalyzer.swift
//  TrailAnalyzer
//
//  Created by Neil Thorne on 6/17/25.
//

import Foundation
import CoreML

struct TrailAnalyzer {
    func predictRisk(trailInfo: TrailInfo) -> Risk {
        do {
            let model = try TrailAnalyzerModel(configuration: MLModelConfiguration())
            
            // requires these two inputs, or else just defaults to high risk
            guard let distance = trailInfo.distance,
                  let terrain = trailInfo.terrain else {
                return .highRisk
            }
            
            let input = TrailAnalyzerModelInput(
                distance: Int64(distance),
                elevation: Int64(trailInfo.elevation ?? 0),
                terrain: terrain.rawValue,
                dangerous: Int64(trailInfo.wildlifeDangerLevel)
            )
            
            let predictedRisk = try model.prediction(input: input).risk
            
            switch predictedRisk {
            case 0..<20:
                return .easy
            case 20..<50:
                return .moderate
            case 50..<100:
                return .difficult
            default:
                return .highRisk
            }
        } catch {
            return .highRisk
        }
    }
}
