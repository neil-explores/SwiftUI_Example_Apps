//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/19/25.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // notation to specify keypath to a property, in this case the `id` property: \.id
        NavigationSplitView {
            // Why List instead of combbo of List and ForEach?
            // Sometimes in a list you need a "header" and a "footer"
            // In circumstances like that, ForEach is more fine-grained for each row
            // Example below: we have a Toggle we want included in the list
            // So we want some extra "stuff" beyond the list!!!
            // If you just want the list and no extra "stuff", no need for the ForEach...
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
