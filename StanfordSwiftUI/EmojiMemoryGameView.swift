//
//  EmojiMemoryGameView.swift
//  StanfordSwiftUI
//
//  Created by Ahmed-Ali on 5/27/20.
//  Copyright © 2020 com.spik.swiftui. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        HStack{
            GridVeiw(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.padding(5)
            }
        }.padding()
         .foregroundColor(.orange)
    }
}

struct  CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader() { geometry in
            self.body(for: geometry.size)
        }
    }
    func body(for size: CGSize) -> some View {
        
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                     RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
               
            }
        }.aspectRatio(2/3, contentMode: .fit)
         .font(.system(size: font(for: size)))
    }
    
    func font(for size: CGSize) -> CGFloat{
        return min(size.height, size.width) * 0.75
    }
    
    // MARK: drawwing constant
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
