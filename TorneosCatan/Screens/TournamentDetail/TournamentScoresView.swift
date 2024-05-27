//
//  TournamentScoresView.swift
//  TorneosCatan
//
//  Created by coni garcia on 25/05/2024.
//

import Charts
import SwiftUI

struct TournamentScoresView: View {
    let tournament: Tournament
    let games: Int
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd/MM"
        return df
    }
    
    var body: some View {
        VStack {
            Title(title: "Puntajes")
                .padding(.horizontal)
            
            Chart {
                ForEach(tournament.games.sorted{$0.date < $1.date}.suffix(games)) { game in
                    ForEach(game.scores) { score in
                        PointMark(
                            x: .value("Partida", dateFormatter.string(from: game.date)),
                            y: .value("Puntaje", score.score)
                        )
                        .symbol(by: .value("Jugador", score.player!.name))
                        .foregroundStyle(score.player!.color.color)
                        LineMark(
                            x: .value("Partida", dateFormatter.string(from: game.date)),
                            y: .value("Puntaje", score.score)
                        )
                        .lineStyle(.init(lineWidth: 2))
                        .symbol(by: .value("Jugador", score.player!.name))
                        .foregroundStyle(score.player!.color.color)
                    }
                }
            }
            .chartSymbolScale(range: [.circle])
            .chartYScale(domain: 0...20)
            .chartLegend(.hidden)
            .frame(height: 250)
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    TournamentScoresView()
//}
