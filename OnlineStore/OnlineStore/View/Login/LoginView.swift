//
//  LoginView.swift
//  OnlineStore
//
//  Created by Nga Vũ on 25/10/2023.
//

import SwiftUI
import CountryPicker

struct LoginView: View {
    @State var phoneNumber = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .screenWidth, maxHeight: .screenHeight, alignment: .top)
            
            ZStack {
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
                        Button {
                            isShowPicker = true
                        } label: {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                
                                Text("\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        Divider()
                            .frame(height: 20)
                        
                        TextField("Số điện thoại", text: $phoneNumber)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18, design: .default))
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                            .keyboardType(.numberPad)
                            .onChange(of: phoneNumber) { newValue in
                                if newValue.count > 9 {
                                    phoneNumber = String(newValue.prefix(9))
                                }
                            }
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    .cornerRadius(10)
                }
            }
        }
        .onAppear {
            self.countryObj = Country(phoneCode: "+84", isoCode: "VN")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPicker(country: $countryObj)
        })
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
