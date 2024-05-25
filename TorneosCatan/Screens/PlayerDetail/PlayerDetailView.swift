//
//  PlayerDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct PlayerDetailView: View {
    let player: Player
    
    @State var tournament: Tournament?

    var body: some View {
        ScrollView {
            PlayerTournamentsView(player: player, selected_tournament: $tournament)
                .padding(.top)

            if !player.tournaments.isEmpty {
                PlayerScoresView(player: player, tournament: $tournament)
                    .padding(.top)
            }
            
            Spacer()
        }
        .navigationTitle(player.name)
        .onAppear {
            if tournament == nil {
                tournament = player.tournaments.first
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {
        PlayerDetailView(player: Player.samplePlayes[0])
            .modelContainer(preview.container)
    }
}
