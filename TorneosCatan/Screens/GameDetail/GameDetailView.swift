//
//  GameDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct GameDetailView: View {
    @Bindable var game: Game
    
    @State var editGame = false
    
    var durationString: String {
        let hours = Int(game.duration/3600)
        let minutes = Int((game.duration/3600).truncatingRemainder(dividingBy: 1) * 60)
        if hours == 0 && minutes == 0 {
            return "???"
        }
        if hours < 0 || minutes < 0 {
            return "???"
        }
        return "\(hours):\(minutes)"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                HStack {
                    FactCard(
                        fact: durationString,
                        primaryDescription: "duración",
                        secondaryDescription: nil,
                        color: Color(.accent)
                    )

                    if let bank = game.bank {
                        FactCard(
                            fact: bank.name,
                            primaryDescription: "banco",
                            secondaryDescription: nil,
                            color: Color(.accent)
                        )
                    }
                }
                .padding(.top)
                
                Title(title: "Puntajes:")
                    .padding(.top)
                    .padding(.horizontal)
                
                ForEach(game.scores.sorted { $0.score > $1.score }) { score in
                    HStack {
                        PlayerRowView(player: score.player!)
                            .foregroundStyle(score.player!.color.color)
                        Spacer()
                        Text("\(score.score)")
                            .fontWeight(.bold)
                    }
                    .rowStyle()
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $editGame) {
            EditGameView(game: game)
        }
        .navigationTitle("Partida \(game.date.formatted(date: .abbreviated, time: .omitted))")
        .toolbar {
            Button("Edit") {
                editGame = true
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Game.self)
//    return NavigationStack {
//        GameDetailView(game: Game.sampleGames[1])
//           .modelContainer(preview.container)
//    }
//}
