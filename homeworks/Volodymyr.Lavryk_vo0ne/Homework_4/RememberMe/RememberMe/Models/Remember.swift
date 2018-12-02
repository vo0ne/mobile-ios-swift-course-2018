//
//  Remember.swift
//  RememberMe
//
//  Created by Volodymyr Lavryk on 12/1/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import Foundation

class Remember {
    
    var cards = [Card]()
    var flips = 0
    var score  = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
    }
    
    func chooseCard(at index: Int) {
        flips += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // If no card or two cards face up
               
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                 score -= 1
            }
            
        }
    }
    
    func newGame() {
        for index in 0..<cards.count {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        score = 0
        flips = 0
    cards.shuffle()
    }
}
