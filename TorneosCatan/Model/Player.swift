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
    var color: PlayerColor
    
    @Relationship(inverse: \Tournament.players)
    var tournaments: [Tournament] = []
    @Relationship(deleteRule: .cascade)
    var scores: [Score] = []
    
    init(name: String, color: PlayerColor) {
        self.name = name
        self.color = color
    }
}
