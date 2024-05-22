//
//  TournamentDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct TournamentDetailView: View {
    let tournament: Tournament

    var body: some View {
        Group {
            VStack {
                HStack {
                    ForEach(tournament.players) { player in
                        Text(player.name)
                    }
                    .padding()
                }
                
                Button("add game") {
                    let scores = tournament.players.map { Score(player: $0, score: 10) }
                    let game = Game(duration: 60*60, scores: scores)
                    tournament.games.append(game)
                }
            }
        }
        .navigationTitle(tournament.name)
    }
}

#Preview {
    let preview = Preview(Tournament.self, Player.self)
    preview.addSamples(Tournament.sampleTournaments)
    return NavigationStack {
        TournamentDetailView(tournament: Tournament.sampleTournaments[0])
            .modelContainer(preview.container)
    }
}
