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
    
    var scores: [Player: Int] {
        var scores = [Player: Int]()
        for player in self.players {
            scores[player] = 0
        }
        for game in self.games {
            for score in game.scores {
                scores[score.player!]! += score.score
            }
        }
        return scores
    }
    
    var ranking: [Player] {
        return self.scores.sorted(by: { $0.1 > $1.1 }).map { $0.0 }
    }
}
