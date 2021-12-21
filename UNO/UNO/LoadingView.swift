//
//  LoadingView.swift
//  UNO
//
//  Created by Aleksandra Front on 07/12/2021.
//

import SwiftUI

struct LoadingView: View {
    @State var playersReady = false
    var username: String
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                
                Image("logo").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 110)
                    .padding(.bottom, 15.0)
                Text("Waiting for others to join...")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                    .scaleEffect(x: 3, y: 3)
                Spacer()
                Spacer()
                
                Button {
                    playersReady = true
                } label: {
                    Text("GO!")
                }

            }
        }
        .background(
            Image("background")
                .ignoresSafeArea()
            )
        .navigate(to: GameView(username: username), when: $playersReady)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(username: "userJA")
            .previewDevice("iPhone 8")
    }
}
