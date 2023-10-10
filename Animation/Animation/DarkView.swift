//
//  DarkView.swift
//  Animation
//
//  Created by Nga Vũ on 10/10/2023.
//

import SwiftUI

struct DarkView: View {
    @State var rotation:CGFloat = 0.0

    var body: some View {
        ZStack {
            Color(.darkGray)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 130, height: 500)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 4)
                        .frame(width: 256, height: 336)
                }
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

#Preview {
    DarkView()
}
