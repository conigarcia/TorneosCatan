//
//  Score.swift
//  TorneosCatan
//
//  Created by coni garcia on 21/05/2024.
//

import Foundation
import SwiftData

@Model
final class Score {
    let player: Player
    var game: Game?
    let score: Int
    
    init(player: Player, game: Game? = nil, score: Int) {
        // TODO: check that the player participates in the game's tournament
        self.player = player
        self.game = game
        self.score = score
    }
}
