//
//  SearchableListView.swift
//  UNO
//
//  Created by Aleksandra Front on 05/12/2021.
//

import SwiftUI

struct SearchableListView: View {
    
    @State var searchingFor = ""
    @State var elements: [String]
    @State var textOnButton: String
    var alertMessage: String = ""
    @Binding var readyToPlay: Bool
    
    
    var body: some View {
        
        ZStack {
               
            VStack {
                TextFieldView(text: $searchingFor, placeholder: "search")
                ScrollView (.vertical) {
                    Group {
                        ForEach (results, id: \.self ) {element in
                            UserRowView(user: UserModel(username: element), textOnButton: textOnButton, alertMessage: alertMessage, readyToPlay: $readyToPlay)
                        }
                        
                    }.searchable(text: $searchingFor)
                    
                }
            }
        }
        .background(Color(hue: 0.143, saturation: 0.633, brightness: 1.0, opacity: 0.0))
        

        
    }
    
    var results: [String] {
        if (searchingFor.isEmpty) {
            return elements
        } else {
            return elements.filter { $0.contains(searchingFor) }
        }
    }
}


struct SearchableListView_Previews: PreviewProvider {
    var readyToPlay = false
    static var previews: some View {
        SearchableListView(elements: ["12", "13", "14"], textOnButton: "accept", readyToPlay: .constant(false))
            .previewDevice("iPhone 8")
    }
}
