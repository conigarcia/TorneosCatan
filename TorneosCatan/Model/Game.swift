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
    var tournament: Tournament?
    let date: Date
    let duration: TimeInterval
    @Relationship(deleteRule: .cascade)
    var scores: [Score] = []
    
    var players: [Player] { tournament?.players ?? [] }
    
    init(tournament: Tournament? = nil, date: Date = Date(), duration: TimeInterval, scores: [Score]) {
        self.tournament = tournament
        self.date = date
        self.duration = duration
        self.scores = scores
    }
}
