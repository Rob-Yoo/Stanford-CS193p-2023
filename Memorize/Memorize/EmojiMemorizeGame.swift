//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/09.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["💻", "🚨", "☎️", "🎉", "💡", "🕹️", "📺", "⏱️", "💵"] // 클래스가 초기화되기 전에 정적 변수가 먼저 초기화 됨

    private static func createMemoryGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🙏"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
// MARK : - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
}
