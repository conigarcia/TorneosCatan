//
//  Tournament.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import Foundation
import SwiftData

@Model
final class Tournament {
    var name: String
    
    var players: [Player] = []
    @Relationship(deleteRule: .cascade)
    var games: [Game] = []
    
    init(name: String, players: [Player]) {
        self.name = name
        self.players = players
    }
}
