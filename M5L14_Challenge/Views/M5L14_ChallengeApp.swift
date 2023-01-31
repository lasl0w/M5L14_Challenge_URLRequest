//
//  M5L14_ChallengeApp.swift
//  M5L14_Challenge
//
//  Created by tom montgomery on 1/29/23.
//

import SwiftUI

@main
struct M5L14_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: FactsModel())
                // instead of .environmentObject, calling the instance and passing it in that way
        }
    }
}
