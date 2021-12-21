//
//  UserRowView.swift
//  UNO
//
//  Created by Aleksandra Front on 06/12/2021.
//

import SwiftUI

struct UserRowView: View {
    
    var user: UserModel
    var textOnButton: String
    @State private var showingAlert = false
    var alertMessage: String = ""
    @Binding var readyToPlay: Bool
    
    var body: some View {
        
        HStack {
            
            Image(user.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 34, height: 50)
                .padding(1.0)
            
            Text(user.username)
            
            Spacer()
            
            Button {
                if (!alertMessage.isEmpty){
                    showingAlert = true
                    readyToPlay = true
                }
                else {
                    readyToPlay = true
                }
                
            } label: {
                LabelButtonView(textOnButton: textOnButton, frameWidth: 100, frameHeight: 40, cornerRadius: 20)
                    .padding(.trailing, 25.0)
                    .scaleEffect(x: 0.8, y: 0.8)
                    .frame(width: 80, height: 40*0.8)
                
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    
                }
            }

        }
        .padding(.leading, 10)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.559)/*@END_MENU_TOKEN@*/)
        .cornerRadius(13.0)
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            UserRowView(user: UserModel(username: "username1"), textOnButton: "accept", readyToPlay: .constant(false))
                .previewDevice("iPhone 8")
                .previewLayout(.fixed(width: 300, height: 70))
            
            UserRowView(user: UserModel(username: "username2"), textOnButton: "accept", readyToPlay: .constant(false))
                .previewDevice("iPhone 8")
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
