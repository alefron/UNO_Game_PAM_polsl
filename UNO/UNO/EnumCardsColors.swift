//
//  EnumCardsColors.swift
//  UNO
//
//  Created by Aleksandra Front on 13/12/2021.
//

import Foundation

enum CardsColors : CustomStringConvertible {
    case Blue
    case Yellow
    case Green
    case Red
    case Black
    case None
    
    var description : String {
        switch self {
        case .Blue: return "blue"
        case .Green: return "green"
        case .Black: return "black"
        case .Red: return "red"
        case .Yellow: return "yellow"
        case .None: return ""
        }
      }
}
