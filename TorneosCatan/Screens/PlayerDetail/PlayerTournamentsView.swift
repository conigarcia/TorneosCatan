//
//  PlayerTournamentsView.swift
//  TorneosCatan
//
//  Created by coni garcia on 24/05/2024.
//

import SwiftUI

struct PlayerTournamentsView: View {
    let player: Player
    
    @Binding var selected_tournament: Tournament?
    
    var body: some View {
        VStack {
            Title(title: "Torneos")
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                if player.tournaments.isEmpty {
                    Text("\(player.name) no participa de ningún torneo")
                        .fontWeight(.medium)
                        .rowStyle()
                }
                ForEach(player.tournaments) { tournament in
                    HStack {
                        TournamentRowView(tournament: tournament)
                            .foregroundStyle(selected_tournament == tournament ? player.color.color : Color(.accent))
                        
                        Spacer()
                        
                        Text("\(tournament.scores[player]!) puntos (#\(tournament.ranking.firstIndex(of: player)! + 1))")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color(.secondaryLabel))
                    }
                    .rowStyle()
                    .onTapGesture {
                        if selected_tournament == tournament {
                            selected_tournament = nil
                        } else {
                            selected_tournament = tournament
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Player.self)
//    return PlayerTournamentsView(player: Player.samplePlayes[0])
//        .modelContainer(preview.container)
//}
