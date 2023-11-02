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
        VStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack(alignment: .center) {
                Text("Chào mừng bạn đến với")
                    .font(.system(size: 18, design: .default))
                    .foregroundColor(.black)
                
                Image("Logo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)
                Text("Hãy nhập số điện thoại của bạn để tiếp tục")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                
                HStack {
                    Button {
                        isShowPicker = true
                    } label: {
                        if let countryObj = countryObj {
                            Text("\(countryObj.isoCode.getFlag())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.primaryText)
                            
                            Text("\(countryObj.phoneCode)")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.primaryText)
                        }
                    }
                    
                    Divider()
                        .frame(height: 20)
                    
                    TextField("Số điện thoại", text: $phoneNumber)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18, design: .default))
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .onChange(of: phoneNumber) { newValue in
                            if newValue.count > 9 {
                                phoneNumber = String(newValue.prefix(9))
                            }
                        }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
                
                RoundButton(title: "Đăng nhập") {
                }
                .padding(.bottom, 20)
                
                
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
                .padding(.bottom, 20)
                
                HStack(alignment: .center) {
                    HStack {
                        Spacer()
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 100, height: 1)
                        Text("Hoặc")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.gray)
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 100, height: 1)
                        Spacer()
                    }
                }
                .padding(.bottom, 20)
                
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
                    }
                }
                .frame(width: 300, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .cornerRadius(10)
                
                Button {
                    // Xử lý sự kiện khi nút được nhấn
                } label: {
                    HStack {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("Đăng nhập với Facebook")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(Color.blue)
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
        .foregroundColor(.white)
        .padding(.bottom, 50)
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
