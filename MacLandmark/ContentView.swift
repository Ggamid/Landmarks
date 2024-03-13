//
//  ContentView.swift
//  MacLandmark
//
//  Created by Gamıd Khalıdov on 22.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
                    .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
