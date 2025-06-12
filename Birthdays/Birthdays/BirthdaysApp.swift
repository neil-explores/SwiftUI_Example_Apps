//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Neil Thorne on 6/11/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)                
        }
    }
}
