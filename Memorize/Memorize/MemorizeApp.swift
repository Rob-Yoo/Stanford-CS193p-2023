//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game)
        }
    }
}
