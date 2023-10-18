//
//  ContentView.swift
//  Landmarks
//
//  Created by Nga Vũ on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Nha Trang")
                    .font(.title)
                HStack {
                    Text("Nha Trang University")
                        .font(.subheadline)
                    Spacer()
                    Text("Khanh Hoa")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                
                Text("About Nha Trang")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
