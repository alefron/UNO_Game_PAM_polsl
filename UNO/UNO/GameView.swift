//
//  GameView.swift
//  UNO
//
//  Created by Aleksandra Front on 07/12/2021.
//

import SwiftUI

struct GameView: View {
    var username: String
    @State var user: UserModel
    @State var CardStackModel: CardStack = CardStack()
    
    @State var firstCard: String = "blueFive"
    @State var secondCard: String = " "
    @State var thirdCard: String = " "
    @State var fourthCard: String = " "
    
    @State var firstIdx: Double = 1
    @State var secondIdx: Double = 2
    @State var thirdIdx: Double = 3
    @State var fourthIdx: Double = 4
    
    init(username: String) {
        self.username = username
        user = UserModel(username: username)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Group {
                        HStack {
                            Text("PLAYER: ")
                                .font(.title2)
                            Text("opponent1")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 240 * 0.1, height: 350 * 0.1)
                            Text("10")
                                .font(.title)
                        }
                        
                        Text("changed to blue")
                            .foregroundColor(Color.yellow)
                        
                        Spacer()
                    
                        Rectangle()
                            .frame(width: geometry.size.width - 40, height: 1)
                            .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.001, opacity: 0.4))
                        
                        Spacer()
                    }
                    Group {
                        HStack {
                            Spacer()
                            
                            CardsStackView(firstCard: $firstCard, secondCard: $secondCard, thirdCard: $thirdCard, fourthCard: $fourthCard, firstIdx: $firstIdx, secondIdx: $secondIdx, thirdIdx: $thirdIdx, fourIdx: $fourthIdx)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image("back")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 240*0.3, height: 350*0.3)
                                    .frame(width: 240*0.3, height: 350*0.3)
                                    .transformEffect(CGAffineTransform(translationX: 0, y: -10))
                            }
                            Spacer()
                        }
                        .padding(.top)
                        
                        Spacer()
                        Rectangle()
                            .frame(width: geometry.size.width - 40, height: 1)
                            .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.001, opacity: 0.4))
                        Spacer()
                    }
                    
                    Group {
                        HStack {
                            Text("PLAYER: ")
                                .font(.title2)
                            Text(user.username)
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "arrowtriangle.left.fill")
                                    .foregroundColor(Color(red: 0.976, green: 0.887, blue: 0.354))
                            }

                            Image("blueFive")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 240*0.3, height: 350*0.3)
                            Button {
                                
                            } label: {
                                Image(systemName: "arrowtriangle.right.fill")
                                    .foregroundColor(Color(red: 0.976, green: 0.887, blue: 0.354))
                            }
                            Spacer()
                            VStack {
                                Button {
                                    
                                } label: {
                                    LabelButtonView(textOnButton: "Play", frameWidth: 130, frameHeight: 50, cornerRadius: 30)
                                }
                                
                                Button {
                                    
                                } label: {
                                    LabelButtonView(textOnButton: "Say UNO!", frameWidth: 130, frameHeight: 50, cornerRadius: 30)
                                }
                            }
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        Spacer()
                        Rectangle()
                            .frame(width: geometry.size.width - 40, height: 1)
                            .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.001, opacity: 0.4))
                        Spacer()
                    }
                    
                    HStack {
                        ScrollView (.horizontal) {
                            HStack {
                                Group {
                                    ForEach (cardsToShow, id: \.self ) {element in
                                        CardElementView(cardName: element)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top)
                    
                    
                    Button {
                        self.addCardClicked()
                    } label: {
                        Text("add card")
                    }
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
        }
        .background(
            Image("background")
                .ignoresSafeArea()
        )
    }
    
    var cardsToShow: [String] {
        return user.getCardsNames()
    }
    
    func addCardClicked() {
        CardStackModel.addNewCard()
        
        secondCard = CardStackModel.getSecondCard()
        firstCard = CardStackModel.getFirstCard()
        thirdCard = CardStackModel.getThirdCard()
        fourthCard = CardStackModel.getFourthCard()
        
        firstIdx = CardStackModel.getFirstIndex()
        secondIdx = CardStackModel.getSecondIndex()
        thirdIdx = CardStackModel.getThirdIndex()
        fourthIdx = CardStackModel.getFourthIndex()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(username: "UserrrJA")
            .previewDevice("iPhone 8")
    }
}
