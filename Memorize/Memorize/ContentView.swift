//
//  ContentView.swift
//  Memorize
//
//  Created by Jinyoung Yoo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💻", "🚨", "☎️", "🎉"]
    var body: some View {
        HStack {
            // 뷰 빌더의 클로저 안에서는 조건문, 단순 코드, 지역 변수 사용만 가능
            // 단순 for, while 반복문 불가능
            // 따라서, 반복문 기능을 하는 함수를 사용해야 한다.
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.green)
        .padding()
    }
}
struct CardView: View {
    let content: String
    @State var isFacedUp: Bool = true // React의 State와 비슷함
    // 구조체에서는 당연히 프로퍼티 값을 바꾸지 못함. 따라서 SwitfUI에서는 @State라는 프로퍼티 래퍼를 사용해서 상태 프로퍼티로 정의해서 바꿔줄 수 있음
    // 상태 프로퍼티 값이 바뀌면 재렌더링 신호임
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 10)
//            let base: Circle = Circle()
            if (isFacedUp) {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                base // 디폴트로 fill()이 호출됨 -> base.fill()
            }
        }).onTapGesture(perform: { // perform 인자 생략하고 후행 클로저 사용 가능
            isFacedUp.toggle() // Bool 타입의 변수는 toggle이라는 메서드가 있음
        })
    }
}





// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
