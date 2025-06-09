//
//  DiceView.swift
//  DiceView
//
//  Created by Neil Thorne on 6/5/25.
//

import SwiftUI

struct DiceView: View {
    // You don't want other views changing this property
    // You only want comoputed properties and functions within this view changing this proerty
    // So: we mark it as private.
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
            // .resizable() will fill the ENTIRE available space
            // so pair it with .frame
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.black, .white)
                
                
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
    .background(.appBackground)
}
