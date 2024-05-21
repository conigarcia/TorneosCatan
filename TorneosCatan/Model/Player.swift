//
//  Player.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import Foundation
import SwiftData

@Model
final class Player {
    var name: String
    let color: PlayerColor
    @Relationship(inverse: \Tournament.players)
    var tournaments: [Tournament] = []
    
    init(name: String, color: PlayerColor) {
        self.name = name
        self.color = color
    }
}
