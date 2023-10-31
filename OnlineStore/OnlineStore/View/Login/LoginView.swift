//
//  LoginView.swift
//  OnlineStore
//
//  Created by Nga Vũ on 25/10/2023.
//

import SwiftUI
import PhoneNumberKit
import FlagKit

struct LoginView: View {
    @State private var phoneNumber = ""
    let phoneNumberKit = PhoneNumberKit()
    let countryCode = "+84"
    
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .screenWidth, maxHeight: .screenHeight, alignment: .top)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(maxWidth: .screenWidth, maxHeight: .screenHeight, alignment: .bottom)
                    .cornerRadius(15)
                    .padding(.top, 250)
                    .shadow(color: .gray, radius: 5, x: 0, y: 0)
                
                VStack {
                    Text("Chào mừng bạn đến với")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(.black)
                        .padding(.top, 150)
                    
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
                    
                    RoundButton(title: "Đăng nhập") {
                    }
                    
                    .padding(.top, 30)
                    
                    HStack {
                        Text("Bạn chưa có tài khoản?")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.black)
                        
                        NavigationLink(destination: SigninView()) {
                            Text("Đăng ký")
                                .font(.system(size: 16, design: .default))
                                .foregroundColor(Color.primaryApp)
                        }
                    }
                    .padding(.top, 30)
                    
                    HStack(alignment: .center) {
                        HStack {
                            Spacer()
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 1)
                            Text("Hoặc")
                                .font(.system(size: 16, design: .default))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 10)
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 1)
                            Spacer()
                        }
                        .padding(.top, 10)
                    }
                    
                    Button {
                        // Xử lý sự kiện khi nút được nhấn
                    } label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text("Đăng nhập với Google")
                                .font(.system(size: 16, design: .default))
                                .foregroundColor(Color.blue)
                                .padding(.leading, 10)
                        }
                    }
                    .frame(width: 300, height: 50)
                    .background(.white.opacity(0.5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    .cornerRadius(10)
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        LoginView()
    }
}
