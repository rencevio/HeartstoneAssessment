//
// Created by Maxim Berezhnoy on 13/12/2019.
// Licensed under the MIT license
//
// Copyright (c) 2019 rencevio. All rights reserved.

import Foundation

struct Card: Decodable {
    struct Mechanic: Decodable {
        let name: String
    }
    
    let cardId: String
    let name: String
    let type: String
    let rarity: String?
    let mechanics: [Mechanic]?
    let img: URL?
    let playerClass: String?
    let flavor: String?
}