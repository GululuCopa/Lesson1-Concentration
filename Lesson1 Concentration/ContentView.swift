//
//  ContentView.swift
//  Lesson1 Concentration
//
//  Created by Copa1 on 2024/10/31.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "🎃", "👻", "😎", "👿"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) {
                index in CardView(content: emojis[index])
            }
            
            ForEach(emojis, id: \.self) {
                emoji in CardView(content: emoji)
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
        
    }
}
    
struct CardView : View {
    let content : String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10, 2]))
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
