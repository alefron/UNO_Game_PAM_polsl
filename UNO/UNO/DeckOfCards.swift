//
//  DeckOfCards.swift
//  UNO
//
//  Created by Aleksandra Front on 13/12/2021.
//

import Foundation

struct CardWithCount {
    var card: CardModel
    var countInDeck: Int = 2
    
    init(card: CardModel, countInDeck: Int) {
        self.card = card
        self.countInDeck = countInDeck
    }
    
    init(card: CardModel) {
        self.card = card
    }
}

class DeckOfCards {
    var availableCards: [CardWithCount]
    private var availableCardsNames = ["yellowOne", "yellowTwo", "yellowZero", "yellowThree",
    "yellowFour", "yellowFive", "yellowSix", "yellowSeven", "yellowEight",
    "yellowNine", "greenZero", "greenOne", "greenTwo", "greenThree",
    "greenFour", "greenFive", "greenSix", "greenSeven", "greenEight",
    "greenNine", "blueZero", "blueOne", "blueTwo", "blueThree", "blueFour",
    "blueFive", "blueSix", "blueSeven", "blueEight", "blueNine",
    "redZero", "redOne", "redTwo", "redThree", "redFour", "redFive",
    "redSix", "redSeven", "redEight", "redNine", "yellowStop",
    "greenStop", "redStop", "blueStop", "yellowPlusTwo", "greenPlusTwo",
    "bluePlusTwo", "redPlusTwo", "yellowReverse", "blueReverse", "greenReverse",
    "redReverse", "plusFour", "changeColor"]
    
    init() {
        self.availableCards = []
        
        self.availableCardsNames.forEach { name in
            let indexC = name.index(name.startIndex, offsetBy: 1)
            let colorLetter = name.prefix(upTo: indexC)
            
            let indexV = name.index(name.endIndex, offsetBy: -5)
            let valueLetters = name[indexV...]
            
            var colorEnum: CardsColors
            var valueEnum: CardsValues
            
            switch colorLetter {
            case "r":
                colorEnum = CardsColors.Red
            case "b":
                colorEnum = CardsColors.Blue
            case "y":
                colorEnum = CardsColors.Yellow
            case "g":
                colorEnum = CardsColors.Green
            default:
                colorEnum = CardsColors.Black
            }
            
            switch valueLetters {
            case "owOne", "edOne", "ueOne", "enOne":
                valueEnum = CardsValues.One
            case "nZero", "eZero", "dZero", "wZero":
                valueEnum = CardsValues.Zero
            case "owTwo", "edTwo", "ueTwo", "enTwo":
                valueEnum = CardsValues.Two
            case "Three":
                valueEnum = CardsValues.Three
            case "wFour", "nFour", "eFour", "dFour":
                valueEnum = CardsValues.Four
            case "wFive", "nFive", "dFive", "eFive":
                valueEnum = CardsValues.Five
            case "owSix", "edSix", "ueSix", "enSix":
                valueEnum = CardsValues.Six
            case "Seven":
                valueEnum = CardsValues.Seven
            case "Eight":
                valueEnum = CardsValues.Eight
            case "wNine", "dNine", "nNine", "eNine":
                valueEnum = CardsValues.Nine
            case "Color":
                valueEnum = CardsValues.ChangeColor
            case "sFour":
                valueEnum = CardsValues.PlusFour
            case "usTwo":
                valueEnum = CardsValues.PlusTwo
            case "nStop", "dStop", "eStop", "wStop":
                valueEnum = CardsValues.Stop
            case "verse":
                valueEnum = CardsValues.Reverse
            default:
                valueEnum = CardsValues.Zero
            }
            
            let card = CardModel(color: colorEnum, value: valueEnum)
            
            var count = 2
            if (valueEnum == .Zero) {
                count = 1
            } else if (valueEnum == .PlusFour || valueEnum == .ChangeColor) {
                count = 4
            }
            
            let cardWithCount = CardWithCount(card: card, countInDeck: count)
            
            self.availableCards.append(cardWithCount)
        }
    }
    
    private func getEntireDeck() -> [Int] {
        var allCardsIndexes: [Int] = []
        for index in 0..<self.availableCards.count {
            if (availableCards[index].countInDeck > 0) {
                for _ in 1...availableCards[index].countInDeck {
                    allCardsIndexes.append(index)
                }
            }
        }
        return allCardsIndexes
    }
    
    func getCardFromDeck() -> CardModel {
        let currentDeck = getEntireDeck()
        if (!currentDeck.isEmpty) {
            let randomNumber = Int.random(in: 0..<currentDeck.count)
            let randomCardIndex = currentDeck[randomNumber]
            let card = availableCards[randomCardIndex].card
            availableCards[randomCardIndex].countInDeck -= 1
            return card
        } else {
            return CardModel(color: .None, value: .Back)
        }
    }
}
