# 과제 1을 마치고...

- 사용한 SwiftUI 요소

>     - V,H,ZStack
>     - LazyVGrid & GridItem & ForEach
>     - @State & @Binding

<br/>

- 화면 레이아웃

```swift
	VStack {
		Text("Memorize!").font(.largeTitle)

		ScrollView {
			CardGridView(theme: theme)
		}

		HStack(spacing: 40) {
			ButtonView(theme: $theme, buttonContent: .vehicles)
			ButtonView(theme: $theme, buttonContent: .emotions)
			ButtonView(theme: $theme, buttonContent: .animals)
		}
	}
```
<br/>

- 구현 기능

  > - 뒷면인 카드를 탭하면 앞면이 나오고 특정 이모티콘이 나온다.
  > - 테마 버튼을 누르면 특정 테마에 맞춰 카드의 색깔과 이모티콘의 테마가 달라진다.

- 부족한 점
  > - 한 테마에서 카드를 앞면으로 뒤집었을 때, 다른 테마로 넘어가면 앞면으로 되있는 카드가 유지된다.
  > - 이를 해결하고자 했는데 @State와 @Binding만 가지고는 구현이 안될 것 같다.
  > - ContentView(최상위 뷰)의 @State값의 변화가 모든 CardView(최하위 뷰)에서 인지하여 카드를 앞뒤로 뒤짚게 만드는 @State 변수인 isFacedUp를 false로 만들어야 한다.
  > - State 값 드릴링으로 구현하라 하면 할 수 있지만, 분명 리액트의 리덕스처럼 이를 위한 도구가 있을 것 같아 굳이 구현하진 않았다.
