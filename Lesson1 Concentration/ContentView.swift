//
//  ContentView.swift
//  Lesson1 Concentration
//
//  Created by Copa1 on 2024/10/31.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "🎃", "👻", "😎", "👿",
                  "💀", "🎃", "👻", "😎", "👿",
                  "💀", "🎃", "👻", "😎", "👿",
                  "🎃", "👻", "😎", "👿"]
    
    @State var cardCount : Int = 4
    
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
    
    // 当 cardCount 小于 emojis 数组总数时，显示 "Add Card" 按钮
    var cardAdder : some View {
        return cardCountAdjusterBuilder(
            by: +1, symbol: "rectangle.stack.fill.badge.plus"
        )
    }
    
    // 当 cardCount 大于 1 时，显示 "Remove Card" 按钮
    var cardRemover : some View {
        return cardCountAdjusterBuilder(
            by: -1, symbol: "rectangle.stack.fill.badge.minus"
        )
    }
    
    // 卡片数组
    var cards : some View {
        // cards
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 10) {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
    
    // 卡片调节器 +-
    var cardCountAdjusters : some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .padding()
        .imageScale(.large)
        .font(.title)
    }
    
    // 构建 按扭
    func cardCountAdjusterBuilder(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }) {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    let content: String
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                // 正面内容
                base.fill(Color.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10, 2]))
                Text(content).font(.largeTitle)
            } else {
                // 背面内容
                base.fill(Color.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        // 添加翻转动画
        .animation(.easeInOut, value: isFaceUp)
    }
}


#Preview {
    ContentView()
}
