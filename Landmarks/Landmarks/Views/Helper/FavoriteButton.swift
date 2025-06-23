//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/20/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }

    }
}


// Here is one way to pass in a binding into a preview when it expects a binding
// For setup, we first need to stub an @State variable
// Note that to stub a state variable in a preview, we need to use the @Previewable macro
#Preview("stubbed state") {
    @Previewable @State var myTestBool: Bool = true
    FavoriteButton(isSet: $myTestBool)
}

// The issue with this is that you cannot toggle because `true` is an immutable binding: the value can't change
#Preview("constant") {
    FavoriteButton(isSet: .constant(true))
}
