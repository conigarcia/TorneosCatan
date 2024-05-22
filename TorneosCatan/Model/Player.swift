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
    @Relationship(deleteRule: .cascade)
    var scores: [Score] = []
    
    init(name: String, color: PlayerColor, tournaments: [Tournament] = [], scores: [Score] = []) {
        self.name = name
        self.color = color
        self.tournaments = tournaments
        self.scores = scores
    }
}
