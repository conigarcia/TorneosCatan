//
//  PlayerScoresView.swift
//  TorneosCatan
//
//  Created by coni garcia on 25/05/2024.
//

import Charts
import SwiftUI

struct PlayerScoresView: View {
    let player: Player
    
    @Binding var tournament: Tournament?
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd/MM"
        return df
    }

    var body: some View {
        VStack {
            Title(title: "Puntajes")
                .padding(.horizontal)
            
            Chart(player.scores.sorted { $0.game!.date < $1.game!.date }) { score in
                PointMark(
                    x: .value("Partida", dateFormatter.string(from: score.game!.date)),
                    y: .value("Puntaje", score.score)
                )
                .symbol(by: .value("Torneo", score.game!.tournament!.name))
                .foregroundStyle(score.game!.tournament! == tournament ? Color(.accent) : player.color.color)
                LineMark(
                    x: .value("Partida", dateFormatter.string(from: score.game!.date)),
                    y: .value("Puntaje", score.score)
                )
                .lineStyle(.init(lineWidth: score.game!.tournament! == tournament ? 2 : 0))
                .symbol(by: .value("Torneo", score.game!.tournament!.name))
                .foregroundStyle(score.game!.tournament! == tournament ? Color(.accent) : player.color.color)
            }
            .chartSymbolScale(range: [.circle, .circle])
            .chartYScale(domain: 0...20)
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel(orientation: .verticalReversed) {
                        Text(value.as(String.self)!)
                    }
                    AxisGridLine(centered: true)
                }
            }
            .chartLegend(.hidden)
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 20)
            .defaultScrollAnchor(.trailing)
            .scrollIndicators(.visible)
            .frame(height: 250)
            .padding(.horizontal)
            .animation(.none, value: tournament)
        }
    }
}

//#Preview {
//    let preview = Preview(Player.self)
//    return PlayerScoresView(player: Player.samplePlayes[0])
//        .modelContainer(preview.container)
//}
