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
                FactCard(
                    fact: String(games_won),
                    primaryDescription: "partidas ganadas",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )
                
                let games_played = selected_tournament == nil ? player.scores.count : gamesPlayedSelectedTournament()
                FactCard(
                    fact: String(games_played),
                    primaryDescription: "partidas jugadas",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )
            }
            
            GridRow {
                let last_won = selected_tournament == nil ? totalLastGameWon() : lastGameWonSelectedTournament()
                FactCard(
                    fact: last_won ?? "-",
                    primaryDescription: "últ partida ganada",
                    secondaryDescription: selected_tournament == nil ? nil : "de \(selected_tournament!.name)",
                    color: selected_tournament == nil ? player.color.color : Color(.accent)
                )

                let average_points = selected_tournament == nil ? totalAveragePoints() : averagePointsSelectedTournament()
                FactCard(
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
    
    func totalLastGameWon() -> String? {
        let last_score = player.scores.sorted(by: {$0.game!.date < $1.game!.date}).last(where: {$0.score == 18})
        if let ls = last_score {
            return dateFormatter.string(from: ls.game!.date)
        } else {
            return nil
        }
    }

    func lastGameWonSelectedTournament() -> String? {
        let last_score = player.scores.sorted(by: {$0.game!.date < $1.game!.date}).last(where: {$0.game!.tournament == selected_tournament && $0.score == 18})
        if let ls = last_score {
            return dateFormatter.string(from: ls.game!.date)
        } else {
            return nil
        }
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
