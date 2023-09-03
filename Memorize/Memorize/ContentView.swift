//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // some View 타입은 View 프로토콜을 따르는 반환값 중 어떤 것을 의미 (정확한 타입이 뭔지 모를 때 사용)
        HStack {
            // 후행 클로저 -> content: () -> View가 생략
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
        // ZStack { ---- } 처럼 content 인자를 생략 해도 됨
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





// 시뮬레이터가 아닌 프리뷰 화면에 띄울 뷰를 설정할 수 있음
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
