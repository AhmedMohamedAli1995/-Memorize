//
//  MemoriesGame.swift
//  StanfordSwiftUI
//
//  Created by Ahmed-Ali on 5/27/20.
//  Copyright © 2020 com.spik.swiftui. All rights reserved.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    var indexOfTheOnlyAndOnlyFaceUpCard: Int?
    init(numberOfCards: Int, contentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfCards {
            let content = contentFactory(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: (index*2) + 1, content: content))
        }
        shuffleElement()
    }
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chossenIndex = cards.index(of: card), !cards[chossenIndex].isFaceUp, !cards[chossenIndex].isMatched {
            if let potintialMatchIndex = indexOfTheOnlyAndOnlyFaceUpCard {
               if cards[potintialMatchIndex].content == cards[chossenIndex].content {
                    cards[potintialMatchIndex].isMatched = true
                    cards[chossenIndex].isMatched = true
                }
                indexOfTheOnlyAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyAndOnlyFaceUpCard = chossenIndex
            }
            self.cards[chossenIndex].isFaceUp =  true
        }
    }
    
    
    mutating func shuffleElement() {
        cards = cards.shuffled()
    }
    struct Card: Identifiable  {
  
        
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
