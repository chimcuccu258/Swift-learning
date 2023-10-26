//
//  WelcomeView.swift
//  OnlineStore
//
//  Created by Nga Vũ on 25/10/2023.
//

import SwiftUI
import PhoneNumberKit
import FlagKit

struct WelcomeView: View {
    @State private var phoneNumber = ""
    let phoneNumberKit = PhoneNumberKit()
    let countryCode = "+84"
    
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            ZStack {
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
                        .padding(.top, 100)
                        
                    Image("Logo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 50)
                    Text("Hãy nhập số điện thoại của bạn để tiếp tục")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(.black)
                        .padding(.vertical, 30)
                    
                    HStack {
                        if let flagImage = Flag(countryCode: "VN")?.image(style: .roundedRect) {
                            Image(uiImage: flagImage)
                                .frame(width: 30, height: 20)
                        }
                        
                        Text("\(countryCode)")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.black)
                        Divider()
                            .frame(height: 20)
                        TextField("", text: $phoneNumber)
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                            .keyboardType(.numberPad)
                            .onChange(of: phoneNumber) { newValue in
                                if newValue.count > 9 {
                                    phoneNumber = String(newValue.prefix(9))
                                }
                            }
                            .overlay(
                                Text("Số điện thoại")
                                    .font(.system(size: 16, design: .default))
                                    .foregroundColor(.gray)
                                    .opacity(phoneNumber.isEmpty ? 1 : 0)
                                    .padding(.leading, 15),
                                alignment: .leading
                            )
                    }
                    .padding(.horizontal, 40)
                    
                    Button("Đăng nhập") {
                        if phoneNumber.count == 9 {
                            let phoneNumber = countryCode + self.phoneNumber
                            let phoneNumberFormatted = try? phoneNumberKit.parse(phoneNumber)
                            let phoneNumberString = phoneNumberKit.format(phoneNumberFormatted!, toType: .international)
                            print(phoneNumberString)
                        }
                    }
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.vertical, 30)
                    
                    HStack {
                        Text("Bạn chưa có tài khoản?")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.black)
                        Button("Đăng ký") {
                            
                        }
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(.orange)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
