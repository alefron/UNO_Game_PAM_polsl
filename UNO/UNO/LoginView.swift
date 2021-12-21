//
//  ContentView.swift
//  UNO
//
//  Created by Aleksandra Front on 05/12/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var loginClicked = false
    @State var toRegistrationClicked = false
    
    @State var username: String = ""
    @State var password: String = ""
    
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
                
                
                Button {
                    if (username != "" && password != "") {
                        
                        loginClicked = true
                    }
                    
                } label: {
                    LabelButtonView(textOnButton: "LOGIN", frameWidth: 170, frameHeight: 50, cornerRadius: 30)
                }
                
                Button {
                    toRegistrationClicked = true
                } label: {
                    Text("create new account")
                        .foregroundColor(Color(red: 0.972, green: 0.855, blue: 0.159))
                }

                Spacer()
            }
            .padding(21.0)

        }
        .background(
            Image("background")
                .ignoresSafeArea()
        )
        .navigate(to: RegistrationView(), when: $toRegistrationClicked)
        .navigate(to: SelectGameView(username: username), when: $loginClicked)
        
    }
    
    func validateLoginData(username: String, password: String) -> Bool {
        return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 8")
    }
}

