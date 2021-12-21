//
//  EnumCardsValues.swift
//  UNO
//
//  Created by Aleksandra Front on 13/12/2021.
//

import Foundation


enum CardsValues : CustomStringConvertible {
    case Zero
    case One
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case PlusTwo
    case PlusFour
    case Stop
    case Reverse
    case ChangeColor
    case Back
    
    var description : String {
        switch self {
        case .Zero: return "Zero"
        case .One: return "One"
        case .Two: return "Two"
        case .Three: return "Three"
        case .Four: return "Four"
        case .Five: return "Five"
        case .Six: return "Six"
        case .Seven: return "Seven"
        case .Eight: return "Eight"
        case .Nine: return "Nine"
        case .PlusTwo: return "PlusTwo"
        case .PlusFour: return "plusFour"
        case .Stop: return "Stop"
        case .Reverse: return "Reverse"
        case .ChangeColor: return "changeColor"
        case .Back: return "back"
        }
      }
}
