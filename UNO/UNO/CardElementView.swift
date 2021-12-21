//
//  CardElementView.swift
//  UNO
//
//  Created by Aleksandra Front on 19/12/2021.
//

import SwiftUI

struct CardElementView: View {
    @State var cardName: String
    var body: some View {
        VStack {
            Image(cardName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240*0.3, height: 350*0.3)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.0)/*@END_MENU_TOKEN@*/)
    }
}

struct CardElementView_Previews: PreviewProvider {
    static var previews: some View {
        CardElementView(cardName: "blueFive")
            .previewDevice("iPhone 8")
    }
}
