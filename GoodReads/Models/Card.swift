//
//  Card.swift
//  GoodReads
//
//  Created by User on 17/07/2019.
//  Copyright © 2019 Timur LLC. All rights reserved.
//

import Foundation

class Card: Codable {
    var id: String?
    var name: String?
    var type: String?
    var oracle: String?
    var power: String?
    var toughness: String?
    var artist: String?
    var manaCost: String?
    var imageUris: ImageUris?
    
    init(id: String? = nil,
         name: String? = nil,
         type: String? = nil,
         oracle: String? = nil,
         power: String? = nil,
         toughness: String? = nil,
         artist: String? = nil,
         manaCost: String? = nil,
         imageUris: ImageUris? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.oracle = oracle
        self.power = power
        self.toughness = toughness
        self.artist = artist
        self.manaCost = manaCost
        self.imageUris = imageUris
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type = "type_line"
        case oracle = "oracle_text"
        case power
        case toughness
        case artist
        case manaCost = "mana_cost"
        case imageUris = "image_uris"
    }
}

struct CardsResponse: Decodable {
    var object: String?
    var totalCards: Int?
    var hasMore: Bool?
    var nextPage: String?
    var cards: [Card] = []
    
    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case nextPage = "next_page"
        case cards = "data"
    }
}
