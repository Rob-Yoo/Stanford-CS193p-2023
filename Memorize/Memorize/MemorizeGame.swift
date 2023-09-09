//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/09.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {}
    
    struct Card {
        var isFacedUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
