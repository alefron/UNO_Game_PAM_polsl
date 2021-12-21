//
//  SelectGameView.swift
//  UNO
//
//  Created by Aleksandra Front on 05/12/2021.
//

import SwiftUI

struct SelectGameView: View {
    
    @State var username: String
    @State var joinGameClicked = false
    @State var readyToPlay = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Image("logo").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 55)
                    .padding(.bottom, 20.0)
                
                HStack {
                    Text("Create a new game")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 5.0)
                    
                    Spacer()
                }
                
                
                SearchableListView(elements: ["user1", "user2", "user3", "user4", "user5", "user6"], textOnButton: "invite", alertMessage: "The game starts automatically when a selected player accepts your invitation.", readyToPlay: $readyToPlay)

                Button {
                    joinGameClicked = true
                } label: {
                    Text("or join an existing game")
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
        .navigate(to: InvitationsView(username: username), when: $joinGameClicked)
        .navigate(to: LoadingView(username: username), when: $readyToPlay)
    }
}

struct SelectGameView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameView(username: "username")
            .previewDevice("iPhone 8")
    }
}
