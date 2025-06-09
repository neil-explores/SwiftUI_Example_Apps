//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Neil Thorne on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nametoAdd = ""
    @State private var pickedName = ""
    @State private var shouldReomvePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nametoAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nametoAdd.isEmpty {
                        names.append(nametoAdd)
                        nametoAdd = ""
                    }
                    
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldReomvePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldReomvePickedName {
                        names.removeAll { name in
                            name == pickedName
                        }
                    }
                    
                    
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Number")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
