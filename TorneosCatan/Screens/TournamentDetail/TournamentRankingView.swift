//
//  TournamentRankingView.swift
//  TorneosCatan
//
//  Created by coni garcia on 24/05/2024.
//

import Charts
import SwiftUI

struct TournamentRankingView: View {
    let tournament: Tournament
    
    var body: some View {
        VStack {
            HStack {
                Title(title: "Ranking")
                Spacer()
                NavigationLink {
                    RankingView(tournament: tournament)
                } label: {
                    HStack {
                        Text("Historial")
                        Image(systemName: "chevron.right")
                    }
                    .fontWeight(.medium)
                }
            }
            .padding(.horizontal)
            
            Chart {
                ForEach(tournament.scores.sorted {$0.1 > $1.1}, id: \.key) { player, score in
                    BarMark(
                        x: .value("Puntaje", score),
                        y: .value("Jugador", player.name),
                        width: .inset(4)
                    )
                    .annotation(position: .overlay) {
                        HStack {
                            Text("\(player.name)")
                            
                            Spacer()
                            
                            Text("\(score)")
                        }
                        .fontWeight(.semibold)
                        .padding()
                    }
                    .foregroundStyle(player.color.color)
                    .clipShape(.rect(bottomTrailingRadius: 8, topTrailingRadius: 8))
                }
            }
            .chartYAxis(.hidden)
            .frame(height: CGFloat(tournament.players.count * 60))
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return TournamentRankingView(tournament: Tournament.sampleTournaments[0])
//        .modelContainer(preview.container)
//}
