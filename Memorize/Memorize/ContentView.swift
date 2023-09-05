//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💻", "🚨", "☎️", "🎉", "💡", "🕹️", "📺", "⏱️", "💵"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(4/5, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large).font(.largeTitle)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
            }
        , label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    let content: String
    @State var isFacedUp: Bool = true
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)

            base.fill().opacity(isFacedUp ? 0 : 1)
        }).onTapGesture(perform: {
            isFacedUp.toggle()
        })
    }
}





// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
