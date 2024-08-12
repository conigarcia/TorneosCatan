//
//  PlayerFactsView.swift
//  TorneosCatan
//
//  Created by coni garcia on 11/08/2024.
//

import SwiftUI

struct PlayerFactsView: View {
    let player: Player
    
    @Binding var selected_tournament: Tournament?
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd/MM"
        return df
    }
    
    var body: some View {
        Grid {
            GridRow {
                let games_won = selected_tournament == nil ? totalGamesWon() : gamesWonSelectedTournament()
                PlayerFactCard(
                    fact: String(games_won),
                    primaryDescription: "partidas ganadas",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )
                
                let games_played = selected_tournament == nil ? player.scores.count : gamesPlayedSelectedTournament()
                PlayerFactCard(
                    fact: String(games_played),
                    primaryDescription: "partidas jugadas",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )
            }
            
            GridRow {
                let last_won = selected_tournament == nil ? totalLastGameWon() : lastGameWonSelectedTournament()
                PlayerFactCard(
                    fact: last_won,
                    primaryDescription: "últ partida ganada",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )

                let average_points = selected_tournament == nil ? totalAveragePoints() : averagePointsSelectedTournament()
                PlayerFactCard(
                    fact: String(average_points),
                    primaryDescription: "puntos promedio",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )
            }
        }
    }
    
    func totalGamesWon() -> Int {
        return player.scores.reduce(0) { res, score in res + (score.score == 18 ? 1 : 0) }
    }

    func gamesWonSelectedTournament() -> Int {
        return player.scores.reduce(0) { res, score in
            res + (score.game!.tournament == selected_tournament && score.score == 18 ? 1 : 0)
        }
    }
    
    func gamesPlayedSelectedTournament() -> Int {
        return player.scores.reduce(0) { res, score in
            res + (score.game!.tournament == selected_tournament ? 1 : 0)
        }
    }
    
    func totalLastGameWon() -> String {
        let last_score = player.scores.sorted(by: {$0.game!.date < $1.game!.date}).last(where: {$0.score == 18})
        return dateFormatter.string(from: last_score!.game!.date)
    }

    func lastGameWonSelectedTournament() -> String {
        let last_score = player.scores.sorted(by: {$0.game!.date < $1.game!.date}).last(where: {$0.game!.tournament == selected_tournament && $0.score == 18})
        return dateFormatter.string(from: last_score!.game!.date)
    }

    func totalAveragePoints() -> Int {
        let scores = player.scores.reduce(0, { res, score in res + score.score })
        return scores/player.scores.count
    }

    func averagePointsSelectedTournament() -> Int {
        let scores = player.scores.filter {$0.game!.tournament == selected_tournament}
        let scores_sum = scores.reduce(0, { res, score in res + score.score })
        return scores_sum/scores.count
    }
}

struct PlayerFactCard: View {
    let fact: String
    let primaryDescription: String
    let secondaryDescription: String?
    let color: Color
    
    var body: some View {
        GroupBox {
            VStack {
                Text(fact)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(color))
                    .contentTransition(.numericText())
                Text(primaryDescription)
                    .font(.subheadline.smallCaps())
                    .foregroundStyle(Color(.secondaryLabel))
                if secondaryDescription != nil {
                    Text(secondaryDescription!)
                        .font(.caption)
                        .foregroundStyle(Color(.tertiaryLabel))
                        .contentTransition(.numericText())
                }
            }
            .frame(width: 140, height: 70)
        }
        .groupBoxStyle(.TCGroupBoxStyle)
    }
}
