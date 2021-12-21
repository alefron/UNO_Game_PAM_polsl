//
//  RegistrationView.swift
//  UNO
//
//  Created by Aleksandra Front on 05/12/2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var registerClicked = false
    @State var backToLoginClicked = false
    
    @State var username: String = ""
    @State var password: String = ""
    @State var retypedPassword: String = ""
    
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                
                Image("logo").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 110)
                    .padding(.bottom, 50.0)
            
                
                TextFieldView(text: $username, placeholder: "Enter Login")
                
                TextFieldSecuredView(text: $password, placeholder: "Enter Password")
                
                TextFieldSecuredView(text: $retypedPassword, placeholder: "Retype Password")
                
                
                Button {
                    if (!username.isEmpty && !password.isEmpty) {
                        if (password == retypedPassword) {
                            registerClicked = true
                        }
                    }
                } label: {
                    Text("REGISTER")
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.143, saturation: 0.633, brightness: 0.976))
                        .padding()
                        .frame(width: 170, height: 50)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.984, brightness: 0.001, opacity: 0.832)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(30)
                }
                
                Button {
                    backToLoginClicked = true
                } label: {
                    Text("log in to an existing account")
                        .foregroundColor(Color(red: 0.968, green: 0.855, blue: 0.139))
                }

                Spacer()
            }
            .padding(21.0)

        }
        .background(
            Image("background")
                .ignoresSafeArea()
        )
        .navigate(to: LoginView(), when: $backToLoginClicked)
        .navigate(to: LoginView(), when: $registerClicked)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewDevice("iPhone 8")
    }
}
