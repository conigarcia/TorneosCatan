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
    var date: Date
    var duration: TimeInterval
    
    @Relationship(deleteRule: .cascade)
    var scores: [Score] = []
    var tournament: Tournament?
    var bank: Player?
    
    var players: [Player] { tournament!.players }
    
    init(date: Date, duration: TimeInterval, bank: Player? = nil) {
        self.date = date
        self.duration = duration
        self.bank = bank
    }
}
