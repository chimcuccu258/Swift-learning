//
//  Card.swift
//  ParallaxCarousel
//
//  Created by Nga Vũ on 18/10/2023.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var cards: [Card] = [
    .init(title: "Interlaken", subTitle: "Switzerland", image: "1"),
    .init(title: "London", subTitle: "England", image: "2"),
    .init(title: "New York", subTitle: "US", image: "3"),
]
