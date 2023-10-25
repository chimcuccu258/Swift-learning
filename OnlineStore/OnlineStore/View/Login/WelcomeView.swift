//
//  WelcomeView.swift
//  OnlineStore
//
//  Created by Nga Vũ on 25/10/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Rectangle()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .cornerRadius(15)
                .padding(.top, 250)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
            
            VStack {
                Text("Chào mừng bạn đến với")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.black)
                Image("Logo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)
            }
            .padding(.top, -150)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
