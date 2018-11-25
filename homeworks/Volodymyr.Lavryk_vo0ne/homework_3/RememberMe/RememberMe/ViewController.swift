//
//  ViewController.swift
//  RememberMe
//
//  Created by Volodymyr Lavryk on 11/22/18.
//  Copyright © 2018 Volodymyr Lavryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var emojiChoices = ["👾", "👻", "👾", "👻"]
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender), emojiChoices.indices.contains(cardNumber) {
            flipCard(whitEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Selectd card is unknow")
        }
       
    }
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    func flipCard(whitEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
            
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

