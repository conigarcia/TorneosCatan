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
    
    var sortedGames: [Game] { tournament.games.sorted{$0.date < $1.date} }
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd/MM hh:mm"
        return df
    }
    
    var body: some View {
        VStack {
            Title(title: "Puntajes")
                .padding(.horizontal)
            
            Chart {
                ForEach(sortedGames) { game in
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
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel {
                        Text(value.as(String.self)!.split(separator: " ").first!)
                    }
                    AxisGridLine()
                    AxisTick()
                }
            }
            .chartLegend(.hidden)
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3)
            .defaultScrollAnchor(.trailing)
            .frame(height: 250)
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    TournamentScoresView()
//}
