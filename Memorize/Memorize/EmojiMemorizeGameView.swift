//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView( viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.green)
    }
}

struct CardView: View {
    let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFacedUp ? 1 : 0)

            base.fill().opacity(card.isFacedUp ? 0 : 1)
        })
    }
}





// Preview
struct EmojiMemorizeGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemorizeGameView(viewModel: EmojiMemoryGame())
    }
}
