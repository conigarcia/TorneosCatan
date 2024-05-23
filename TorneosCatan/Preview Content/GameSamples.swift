//
//  GameSamples.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import Foundation

extension Game {
    static var sampleGames: [Game] {
        [
            Game(date: Date(timeIntervalSinceNow: -172800), duration: 10800),
            Game(date: Date(timeIntervalSinceNow: -604800), duration: 10080)
        ]
    }
}
