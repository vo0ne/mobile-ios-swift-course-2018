//
//  Themes.swift
//  RememberMe
//
//  Created by Volodymyr Lavryk on 12/2/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import Foundation
import UIKit

struct Style {
    let face: UIColor
    let suit: UIColor
    var emojis: [String]
}

enum Themes: CaseIterable {
    case animals
    case faces
    case sports
    case food
    case flags
    case travelsAndPlaces
    
   public var cardTheme: Style {
        switch self {
        case .animals:
            return Style(face: .black, suit: .green, emojis: ["🐶", "🐱", "🐭", "🦊", "🐻", "🐼", "🦁", "🐷"])
        case .faces:
            return Style(face: .gray, suit: .red, emojis: ["🥰", "🤪", "😎", "😂", "🤬", "🤢", "🤧", "🥶"])
        case .flags:
            return Style(face: .purple, suit: .magenta, emojis: ["🏴‍☠️", "🏁", "🇦🇶", "🇦🇴", "🏳️‍🌈", "🇺🇦", "🏴", "🏳️"])
        case .sports:
            return Style(face: .magenta, suit: .blue, emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🎱"])
        case .food:
            return Style(face: .black, suit: .brown, emojis: ["🍇", "🍉", "🍍", "🍋", "🥐", "🥕", "🥥", "🥗"])
        case .travelsAndPlaces:
            return Style(face: .brown, suit: .cyan, emojis: ["🗾", "🎑", "🏞", "🌅", "🌄", "🌌", "🌆", "🌉"])
            
        }
        
    }
}

