//
//  ViewExtensions.swift
//  UNO
//
//  Created by Aleksandra Front on 05/12/2021.
//

import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct TextFieldView: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.all, 17.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.524)/*@END_MENU_TOKEN@*/)
            .cornerRadius(17.0)
            .padding(.bottom)
    }
    
    func getText() -> String{
        return text
    }
}

struct TextFieldSecuredView: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding(/*@START_MENU_TOKEN@*/.all, 17.0/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.524)/*@END_MENU_TOKEN@*/)
            .cornerRadius(17.0)
            .padding(.bottom)
    }
    func getText() -> String{
        return text
    }
}

struct LabelButtonView: View {
    
    var textOnButton: String
    var frameWidth: CGFloat
    var frameHeight: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        Text(textOnButton)
            .font(.headline)
            .foregroundColor(Color(hue: 0.143, saturation: 0.633, brightness: 0.976))
            .padding()
            .frame(width: frameWidth, height: frameHeight)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.984, brightness: 0.001, opacity: 0.832)/*@END_MENU_TOKEN@*/)
            .cornerRadius(cornerRadius)
    }
}

