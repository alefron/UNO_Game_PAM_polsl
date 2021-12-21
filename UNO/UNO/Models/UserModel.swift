//
//  User.swift
//  UNO
//
//  Created by Aleksandra Front on 06/12/2021.
//

import Foundation
import SwiftUI

class UserModel {
    var username: String = ""
    var password: String = ""
    var winnings: Int = 0
    var looses: Int = 0
    var avatar: String = "blueFive"
    var listOfCards: [CardModel] = []
    
    init(username: String) {
        self.username = username
        
        let card1 = CardModel(color: .Yellow, value: .Zero)
        let card2 = CardModel(color: .Black, value: .ChangeColor)
        let card3 = CardModel(color: .Red, value: .Reverse)
        let card4 = CardModel(color: .Blue, value: .Nine)
        let card5 = CardModel(color: .Green, value: .Stop)
        
        self.listOfCards.append(card1)
        self.listOfCards.append(card2)
        self.listOfCards.append(card3)
        self.listOfCards.append(card4)
        self.listOfCards.append(card5)

    }
    
    func giveCards(deck: DeckOfCards) -> DeckOfCards {
        for _ in 1...5 {
            let card = deck.getCardFromDeck()
            self.listOfCards.append(card)
        }
        return deck
    }
    
    func getCardsNames() -> [String] {
        var names: [String] = []
        listOfCards.forEach { el in
            names.append(el.name)
        }
        return names
    }
}
