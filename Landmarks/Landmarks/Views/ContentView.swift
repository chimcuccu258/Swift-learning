//
//  ContentView.swift
//  Landmarks
//
//  Created by Nga Vũ on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
