//
//  ViewController.swift
//  RememberMe
//
//  Created by Volodymyr Lavryk on 12/1/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Remember(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        game.newGame()
        for var card in game.cards {
            card.isFaceUp = false
        }
         updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Selected card is unknown")
        }
    }
    
    func updateViewFromModel() {
        scoreLabel.text = "Score \(game.score)"
        flipCountLabel.text = "Flips: \(game.flips)"
            for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
                button.isEnabled = false
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
                button.isEnabled = card.isMatched ? false : true
            }
        }
    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    var emojiChoices = ["🍇", "🍉", "🍍", "🍋", "🥐", "🥕", "🥥", "🥗", "🍞"]
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}
