//
//  ContentView.swift
//  StanfordSwiftUI
//
//  Created by Ahmed-Ali on 5/27/20.
//  Copyright © 2020 com.spik.swiftui. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel:EmojiMemoryGame
    var body: some View {
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }.padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct  CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
