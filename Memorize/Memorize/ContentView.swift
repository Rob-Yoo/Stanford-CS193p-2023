//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

enum Theme {
    case vehicles, emotions, animals
    
    var color: Color {
        switch self {
        case .vehicles: return Color.green
        case .emotions: return Color.purple
        case .animals: return Color.red
        }
    }
}

struct ContentView: View {
    @State var theme: Theme = .vehicles

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            cards
            themeChoosingBtns
        }.padding()
    }
    
    var cards: some View {
        ScrollView {
            CardGridView(theme: theme)
        }
    }
    
    var themeChoosingBtns: some View {
        HStack(spacing: 40) {
            Button(action: {
                theme = .vehicles
            }, label: {
                VStack {
                    Image(systemName: "car.rear").imageScale(.large).font(.title)
                    Text("Vehicles")
                }
            })
            Button(action: {
                theme = .emotions
            }, label: {
                VStack {
                    Image(systemName: "face.smiling").imageScale(.large).font(.title)
                    Text("Emotions")
                }
            })
            Button(action: {
                theme = .animals
            }, label: {
                VStack {
                    Image(systemName: "pawprint").imageScale(.large).font(.title)
                    Text("Animals")
                }
            })
        }
    }
}

struct CardGridView: View {
    let theme: Theme
    let columns: [GridItem] = [ GridItem(.adaptive(minimum: 80)) ]
    let emojis: [Theme: [String]] = [
        .vehicles: ["🚗", "🚕", "🚙", "🚌", "🚑", "🚒", "🚓", "🚛", "🚜", "🛵"],
        .emotions: ["😀", "🥹", "😍", "🤨", "😭", "😪", "😬", "🫠", "😤", "😩"],
        .animals: ["🐶", "🐱", "🐹", "🐷", "🦁", "🐨", "🐻", "🐯", "🐸", "🐵"]
    ]
    var selectedEmojis: [String] {
        emojis[theme]!.shuffled() + emojis[theme]!.shuffled()
    }

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(selectedEmojis.indices, id: \.self) { idx in
                CardView(isFacedUp: false,emoji: selectedEmojis[idx], color: theme.color)
            }
        }
    }
//    var selectedEmojis: [String] {
//        emojis[theme]!.shuffled()
//    }
//
//    var body: some View {
//        LazyVGrid(columns: columns) {
//            ForEach(selectedEmojis, id: \.self) { emoji in
//                CardView(emoji: emoji, color: theme.color)
//            }
//            ForEach(selectedEmojis, id: \.self) { emoji in
//                CardView(emoji: emoji, color: theme.color)
//            }
//        }
//    }
}

struct CardView: View {
    @State var isFacedUp: Bool = false
    let emoji: String
    let color: Color
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
            if (isFacedUp) {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5).cornerRadius(10)
                Text(emoji).font(.largeTitle)
            } else {
                base
            }
        }
        .frame(minHeight: 100)
        .foregroundColor(color)
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
    }
}
