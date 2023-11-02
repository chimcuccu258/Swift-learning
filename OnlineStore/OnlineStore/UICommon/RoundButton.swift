//
//  RoundButton.swift
//  OnlineStore
//
//  Created by Nga Vũ on 31/10/2023.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                // .font(.customfont(.semibold, fontSize: 18))
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
        .frame(width: 300, height: 50)
        .background( Color.primaryApp)
        .cornerRadius(10)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
