//
//  TournamentSamples.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import Foundation

extension Tournament {
    static var sampleTournaments: [Tournament] {
        [
            Tournament(
                name: "Familia",
                players: Player.samplePlayes
            ),
            Tournament(
                name: "Chicos",
                players: [
                    Player.samplePlayes[0],
                    Player(name: "Toti", color: .brown),
                    Player(name: "Juampe", color: .green),
                    Player(name: "Fran", color: .white),
                    Player(name: "Moger", color: .blue),
                    Player(name: "Cris", color: .red)
                ]
            )
        ]
    }
}
