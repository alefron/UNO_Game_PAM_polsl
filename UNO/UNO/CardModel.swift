//
//  Card.swift
//  UNO
//
//  Created by Aleksandra Front on 13/12/2021.
//

import Foundation

class CardModel {
    
    var color: CardsColors
    var value: CardsValues
    var type: CardsTypes
    var name: String
    var function: ((CardModel, [CardModel], DeckOfCards) -> [CardModel])?
    
    init(color: CardsColors, value: CardsValues) {
        self.color = color
        self.value = value
        
        if (value == CardsValues.Reverse) {
            self.type = CardsTypes.ReverseQueue
        } else if (value == CardsValues.PlusFour) {
            self.type = CardsTypes.PlusFourCards
        } else if (value == CardsValues.PlusTwo) {
            self.type = CardsTypes.PlusTwoCards
        } else if (value == CardsValues.ChangeColor) {
            self.type = CardsTypes.ChangeColor
        } else if (value == CardsValues.Stop) {
            self.type = CardsTypes.StopPlayer
        } else {
            self.type = CardsTypes.NonFunctional
        }
        
        if (color == .Black) {
            self.name = value.description
        } else {
            self.name = color.description + value.description
        }
        
        switch self.type {
        case CardsTypes.StopPlayer:
            self.function = CardsFunctions.stopPlayer
        case CardsTypes.ChangeColor:
            self.function = CardsFunctions.changeColor
        case CardsTypes.PlusTwoCards:
            self.function = CardsFunctions.plusTwoCards
        case CardsTypes.PlusFourCards:
            self.function = CardsFunctions.plusFourCards
        case CardsTypes.ReverseQueue:
            self.function = CardsFunctions.reverse
        default:
            break
        }
        
    }
    
    func canCardBePlayedOn(card: CardModel) -> Bool {
        if (card.color == self.color || card.value == self.value) {
            return true
        } else {
            return false
        }
    }
}
