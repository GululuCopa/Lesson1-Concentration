//
//  ContentView.swift
//  Lesson1 Concentration
//
//  Created by Copa1 on 2024/10/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
        
    }
}

struct CardView : View {
    var isFaceUp : Bool = false
    
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10, 2]))
                Text("💀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}
