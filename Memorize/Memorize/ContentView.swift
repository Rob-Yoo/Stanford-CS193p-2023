//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    var isFacedUp: Bool = false
    var body: some View {
        ZStack(content: {
            if (isFacedUp) {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 5)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
            Text("💻")
        })
    }
}





// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
