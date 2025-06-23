//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/19/25.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)


            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Turtle Rock") {
    let landmarks = ModelData().landmarks
    // landmarks is a variable defined in the Model --> ModelData file. It is a global variable...
    LandmarkRow(landmark: landmarks[0])
}

#Preview("Salmon") {
    let landmarks = ModelData().landmarks
    LandmarkRow(landmark: landmarks[1])
}

#Preview("Example Group") {
    let landmarks = ModelData().landmarks
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
