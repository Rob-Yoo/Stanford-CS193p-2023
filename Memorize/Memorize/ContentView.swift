//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💻", "🚨", "☎️", "🎉", "💡", "🕹️", "📺", "⏱️", "💵"]
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
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
