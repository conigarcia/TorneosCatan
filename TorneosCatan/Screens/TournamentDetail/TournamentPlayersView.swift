//
//  TournamentPlayersView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct TournamentPlayersView: View {
    let tournament: Tournament
    
    var body: some View {
        VStack {
            Title(title: "Jugadores")
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                ForEach(tournament.players.sorted { $0.name < $1.name }) { player in
                    NavigationLink {
                        PlayerDetailView(player: player, tournament: tournament)
                    } label: {
                        HStack {
                            PlayerRowView(player: player)
                                .foregroundStyle(player.color.color)
                            
                            Spacer()
                            
                            ListArrow()
                        }
                        .rowStyle()
                    }
                }
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return TournamentPlayersView(tournament: Tournament.sampleTournaments[0])
//        .modelContainer(preview.container)
//}
