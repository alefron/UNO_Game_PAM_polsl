//
//  InvitationsView.swift
//  UNO
//
//  Created by Aleksandra Front on 07/12/2021.
//

import SwiftUI

struct InvitationsView: View {
    
    @State var username: String
    @State var createNewGameClicked = false
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
                    Text("Your invitations")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 5.0)
                    
                    Spacer()
                }
                
                SearchableListView(elements: ["user1", "user2", "user3", "user4", "user5", "user6"], textOnButton: "accept", readyToPlay: $readyToPlay)

                
                Button {
                    self.createNewGameClicked = true
                } label: {
                    Text("create a new game")
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
        .navigate(to: SelectGameView(username: username), when: $createNewGameClicked)
        .navigate(to: LoadingView(username: username), when: $readyToPlay)
    }
}

struct InvitationsView_Previews: PreviewProvider {
    static var previews: some View {
        InvitationsView(username: "userja")
            .previewDevice("iPhone 8")
    }
}
