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
        Grid/*(horizontalSpacing: 20, verticalSpacing: 20)*/ {
            GridRow {
                GroupBox {
                    let games_won = selected_tournament == nil ? totalGamesWon() : gamesWonSelectedTournament()
                    VStack {
                        Text(games_won, format: .number)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(selected_tournament == nil ? player.color.color : Color(.accent))
                        Text("partidas ganadas")
                            .font(.subheadline.smallCaps())
                            .foregroundStyle(Color(.secondaryLabel))
                        if selected_tournament != nil {
                            Text("de \(selected_tournament!.name)")
                                .font(.caption)
                                .foregroundStyle(Color(.tertiaryLabel))
                        }
                    }
                    .frame(width: 140)
                    .animation(.none, value: selected_tournament)
                }
                .clipShape(.rect(cornerRadius: 10))
                .animation(.snappy, value: selected_tournament)
                
                GroupBox {
                    VStack {
                        let games_played = selected_tournament == nil ? player.scores.count : gamesPlayedSelectedTournament()
                        Text(games_played, format: .number)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(selected_tournament == nil ? player.color.color : Color(.accent))
                        Text("partidas jugadas")
                            .font(.subheadline.smallCaps())
                            .foregroundStyle(Color(.secondaryLabel))
                        if selected_tournament != nil {
                            Text("de \(selected_tournament!.name)")
                                .font(.caption)
                                .foregroundStyle(Color(.tertiaryLabel))
                        }
                    }
                    .frame(width: 140)
                    .animation(.none, value: selected_tournament)
                }
                .clipShape(.rect(cornerRadius: 10))
                .animation(.snappy, value: selected_tournament)
            }
            
            GridRow {
                GroupBox {
                    let last_won = selected_tournament == nil ? totalLastGameWon() : lastGameWonSelectedTournament()
                    VStack {
                        Text(last_won)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(selected_tournament == nil ? player.color.color : Color(.accent))
                        Text("últ partida ganada")
                            .font(.subheadline.smallCaps())
                            .foregroundStyle(Color(.secondaryLabel))
                        if selected_tournament != nil {
                            Text(selected_tournament!.name)
                                .font(.caption)
                                .foregroundStyle(Color(.tertiaryLabel))
                        }
                    }
                    .frame(width: 140)
                    .animation(.none, value: selected_tournament)
                }
                .clipShape(.rect(cornerRadius: 10))
                .animation(.snappy, value: selected_tournament)

                GroupBox {
                    let average_points = selected_tournament == nil ? totalAveragePoints() : averagePointsSelectedTournament()
                    VStack {
                        Text(average_points, format: .number)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(selected_tournament == nil ? player.color.color : Color(.accent))
                        Text("puntos promedio")
                            .font(.subheadline.smallCaps())
                            .foregroundStyle(Color(.secondaryLabel))
                        if selected_tournament != nil {
                            Text(selected_tournament!.name)
                                .font(.caption)
                                .foregroundStyle(Color(.tertiaryLabel))
                        }
                    }
                    .frame(width: 140)
                    .animation(.none, value: selected_tournament)
                }
                .clipShape(.rect(cornerRadius: 10))
                .animation(.snappy, value: selected_tournament)
            }
        }
        .animation(.snappy, value: selected_tournament)
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
