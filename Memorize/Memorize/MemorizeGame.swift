//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/09.
//

import Foundation

struct MemorizeGame<CardContent> {
    // read-only
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {}
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFacedUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
