//
//  CardStack.swift
//  UNO
//
//  Created by Aleksandra Front on 13/12/2021.
//

import Foundation

struct CardStack {
    var firstCard: String = ""
    var secondCard: String = ""
    var thirdCard: String = ""
    var fourthCard: String = ""
    
    public var firstIdx: Double = 4
    public var secondIdx: Double = 1
    public var thirdIdx: Double = 2
    public var fourthIdx: Double = 3
    
    public var lastAdded: Int = 1
    
    private var deck: DeckOfCards
    
    var availableCards = ["yellowOne", "yellowTwo", "yellowZero", "yellowThree",
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
        deck = DeckOfCards()
        firstCard = generateRandomCard()
    }
    
    func getFirstCard() -> String {
        return firstCard
    }
    
    func getSecondCard() -> String {
        return secondCard
    }
    
    func getThirdCard() -> String {
        return thirdCard
    }
    
    func getFourthCard() -> String {
        return fourthCard
    }
    
    func getFirstIndex() -> Double {
        return firstIdx
    }
    
    func getSecondIndex() -> Double {
        return secondIdx
    }
    
    func getThirdIndex() -> Double {
        return thirdIdx
    }
    
    func getFourthIndex() -> Double {
        return fourthIdx
    }
    
    func generateRandomCard() -> String {
        return deck.getCardFromDeck().name
    }
    
    mutating func addNewCard() {
        let newCardName = generateRandomCard()
        
        switch lastAdded {
        case 1:
            secondCard = newCardName
            lastAdded = 2
        case 2:
            thirdCard = newCardName
            lastAdded = 3
        case 3:
            fourthCard = newCardName
            lastAdded = 4
        case 4:
            firstCard = newCardName
            lastAdded = 1
        default:
            firstCard = ""
        }
        
        if (firstIdx != 1){
            firstIdx = firstIdx - 1
        } else {
            firstIdx = 4
        }
        
        if (secondIdx != 1){
            secondIdx = secondIdx - 1
        } else {
            secondIdx = 4
        }
        
        if (thirdIdx != 1){
            thirdIdx = thirdIdx - 1
        } else {
            thirdIdx = 4
        }
        
        if (fourthIdx != 1){
            fourthIdx = fourthIdx - 1
        } else {
            fourthIdx = 4
        }
    }
}
