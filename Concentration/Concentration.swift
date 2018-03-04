//
//  Concentration.swift
//  Concentration
//
//  Created by LaoBeiXie on 02/01/2018.
//  Copyright © 2018 LaoBeiXie. All rights reserved.
//first commit 

import Foundation
class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var shuffledTemp = [Card]()
    
    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
        
    }
    
    
    
    init(numberOfPairsOfCards: Int) {

        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        for r in 0..<cards.count {
            let rand = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledTemp.append(cards[rand])
            cards.remove(at: rand)
            cards.append(shuffledTemp[r])
        }
    }
}
