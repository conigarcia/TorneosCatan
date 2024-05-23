//
//  Game.swift
//  TorneosCatan
//
//  Created by coni garcia on 21/05/2024.
//

import Foundation
import SwiftData

@Model
final class Game {
    let date: Date
    let duration: TimeInterval
    
    @Relationship(deleteRule: .cascade)
    var scores: [Score] = []
    var tournament: Tournament?
    
    var players: [Player] { tournament!.players }
    
    init(date: Date, duration: TimeInterval) {
        self.date = date
        self.duration = duration
    }
}
