//
//  EmojiMemoryGame.swift
//  StanfordSwiftUI
//
//  Created by Ahmed-Ali on 5/27/20.
//  Copyright © 2020 com.spik.swiftui. All rights reserved.
//

import SwiftUI
//todo: emoji view model

class EmojiMemoryGame: ObservableObject {
    //MARK: VAriables
   @Published private var model = createMemoryGame()
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
   static func createMemoryGame() -> MemoryGame <String> {
    let emojies = ["🇱🇻","🏹","🤲🏻","🤟🏻","👑","🌍","🕋","🏠","😍","🙅🏻"].shuffled().prefix(Int.random(in: 2...5))
        return MemoryGame<String>(numberOfCards: emojies.count) { index in
                emojies[index]
       }
    }
    //MARK: user intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
