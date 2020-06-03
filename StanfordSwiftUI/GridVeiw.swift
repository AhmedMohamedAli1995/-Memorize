//
//  GridVeiw.swift
//  StanfordSwiftUI
//
//  Created by Ahmed-Ali on 5/29/20.
//  Copyright © 2020 com.spik.swiftui. All rights reserved.
//

import SwiftUI

struct GridVeiw<Item, ViewItem>: View where Item: Identifiable, ViewItem: View {
    var items: [Item]
    var viewForItem: (Item) -> ViewItem
    init(_ items:[Item], viewForItem: @escaping (Item) -> ViewItem) {
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader() { geometry in
            ForEach(self.items) { item in
                self.body(for: item, gridLayout: GridLayout(itemCount: self.items.count, in: geometry.size))
            }
        }
    }
    func body(for item: Item, gridLayout: GridLayout)-> some View {
        self.viewForItem(item)
            .frame(width: gridLayout.itemSize.width, height: gridLayout.itemSize.height)
            .position(gridLayout.location(ofItemAt: items.index(of: item)!))
    }
    
}

extension Array where Element: Identifiable {
    func index(of item: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil //:TODO fix this latter...
    }
}
