//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

// MARK: - 카드 테마 관련 enum 타입 선언부

enum Theme: String {
    case vehicles = "Vehicles", emotions = "Emotions", animals = "Animals"
    
    var color: Color {
        switch self {
        case .vehicles: return Color.green
        case .emotions: return Color.purple
        case .animals: return Color.red
        }
    }
    
    var image: Image {
        switch self {
        case .vehicles: return Image(systemName: "car.rear")
        case .emotions: return Image(systemName: "face.smiling")
        case .animals: return Image(systemName: "pawprint")
        }
    }
}

// MARK: - ContentView

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
            ButtonView(theme: $theme, buttonContent: .vehicles)
            ButtonView(theme: $theme, buttonContent: .emotions)
            ButtonView(theme: $theme, buttonContent: .animals)
        }
    }
}

// MARK: - 여러 카드를 그리드 형태로 렌더링 하는 부분

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
                CardView(emoji: selectedEmojis[idx], color: theme.color)
            }
        }
    }
}

// MARK: - 카드 앞면과 뒷면을 렌더링하는 부분

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

// MARK: - 카드의 테마를 정하는 버튼 레이아웃

struct ButtonView: View {
    @Binding var theme: Theme
    let buttonContent: Theme
    
    var body: some View {
        Button(action: {
            theme = buttonContent
        }, label: {
            VStack {
                buttonContent.image.imageScale(.large).font(.title)
                Text(buttonContent.rawValue)
            }
        })
    }
    
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
    }
}
