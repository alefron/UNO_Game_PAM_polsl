//
//  CardsStackView.swift
//  UNO
//
//  Created by Aleksandra Front on 07/12/2021.
//

import SwiftUI

struct CardsStackView: View {
    @Binding var firstCard: String
    @Binding var secondCard: String
    @Binding var thirdCard: String
    @Binding var fourthCard: String
    
    @Binding var firstIdx: Double
    @Binding var secondIdx: Double
    @Binding var thirdIdx: Double
    @Binding var fourIdx: Double
    
    var body: some View {
        VStack {
            ZStack {
                Image(firstCard)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 240*0.4, height: 350*0.4)
                    .transformEffect(CGAffineTransform(translationX: 0, y: -10))
                    .zIndex(firstIdx)
                
                Image(secondCard)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 240*0.4, height: 350*0.4)
                     .transformEffect(CGAffineTransform(rotationAngle: -0.2))
                     .transformEffect(CGAffineTransform(translationX: -24, y: 10))
                     .zIndex(secondIdx)
                
                Image(thirdCard)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 240*0.4, height: 350*0.4)
                    .transformEffect(CGAffineTransform(rotationAngle: 0.3))
                    .transformEffect(CGAffineTransform(translationX: 25, y: -8))
                    .zIndex(thirdIdx)
                
                Image(fourthCard)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 240*0.4, height: 350*0.4)
                    .transformEffect(CGAffineTransform(rotationAngle: 0.05))
                    .transformEffect(CGAffineTransform(translationX: 0, y: -5))
                    .zIndex(fourIdx)
            }
        }
    }
    
    /*mutating func addCard() -> CardsStackView {
        let newCardName = self.getRandomCard()
        switch lastAddedCard {
        case 1:
            self.secondCard = newCardName
            lastAddedCard = 2
            
            secondIdx = 1
            firstIdx = 2
            thirdIdx = 3
            fourIdx = 4
        case 2:
            self.thirdCard = newCardName
            lastAddedCard = 3
            
            thirdIdx = 1
            secondIdx = 2
            firstIdx = 3
            fourIdx = 4
        case 3:
            self.fourthCard = newCardName
            lastAddedCard = 4
            
            fourIdx = 1
            thirdIdx = 2
            secondIdx = 3
            firstIdx = 4
        case 4:
            self.firstCard = newCardName
            lastAddedCard = 1
            
            firstIdx = 1
            fourIdx = 2
            thirdIdx = 3
            secondIdx = 4
        default:
            self.firstCard = ""
        }
        
        return self
    }
    
    func getRandomCard() -> String {
        let randomIdx = Int.random(in: 0..<self.availableCards.count)
        return self.availableCards[randomIdx]
    }*/
}

struct CardsStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardsStackView(firstCard: .constant(" "), secondCard: .constant(" "), thirdCard: .constant(" "), fourthCard: .constant(" "), firstIdx: .constant(4), secondIdx: .constant(3), thirdIdx: .constant(2), fourIdx: .constant(1))
            .previewDevice("iPhone 8")
    }
}
