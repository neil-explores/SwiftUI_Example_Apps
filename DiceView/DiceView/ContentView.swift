//
//  ContentView.swift
//  DiceView
//
//  Created by Neil Thorne on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice: Int = 3
    
    
     var body: some View {
         
         VStack {
             
             Text("Dice Roller")
                 .font(.largeTitle.lowercaseSmallCaps())
                 .foregroundStyle(.white)
             
             HStack {
                 ForEach(1...numberOfDice, id: \.self) { num in
                     DiceView()
                 }
             }
             
             HStack {
                 Button("Remove Dice", systemImage: "minus.circle.fill") {
                     withAnimation {
                         numberOfDice -= 1
                     }
                 }
                 .disabled(numberOfDice == 1)
                 
                 Button("Add Dice", systemImage: "plus.circle.fill") {
                     withAnimation {
                         numberOfDice += 1
                     }
                     
                 }
                 .disabled(numberOfDice == 5)
             }
             .padding()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .labelStyle(.iconOnly)
             .font(.title)
         }
         .background(.appBackground)
         .tint(.white)
    }
}


#Preview {
    ContentView()
}
