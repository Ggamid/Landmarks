//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Gamıd Khalıdov on 10.02.2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
