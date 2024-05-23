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
    let score: Int
    
    var player: Player?
    var game: Game?
    
    init(score: Int) {
        self.score = score
    }
}
