//
//  ViewController.swift
//  RememberMe
//
//  Created by Volodymyr Lavryk on 12/1/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var theme = Themes.sports.cardTheme
    lazy var game = Remember(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var emoji = [Int: String]()
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        randomStyle()
        for var card in game.cards {
            card.isFaceUp = false
        }
        game.newGame()
        updateViewFromModel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        randomStyle()
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
                button.backgroundColor = theme.face
                button.isEnabled = false
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : theme.suit
                button.isEnabled = card.isMatched ? false : true
            }
        }
    }
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, theme.emojis.count > 0 {
            let randomIndex = Int.random(in: 0..<theme.emojis.count)
            emoji[card.identifier] = theme.emojis.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = theme.face
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = theme.suit
        }
    }
    
    func randomStyle() {
        let randomStyleCard = Int.random(in: 0..<Themes.allCases.count)
        print (randomStyleCard)
        emoji.removeAll()
        theme = Themes.allCases[randomStyleCard].cardTheme
        newGameButton.backgroundColor = theme.suit
        
    }
}
