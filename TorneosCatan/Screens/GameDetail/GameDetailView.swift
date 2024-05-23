//
//  GameDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct GameDetailView: View {
    let game: Game
    
    var body: some View {
        Group {
            VStack(alignment: .center) {
                Title(title: "Duración:")
                    .padding(.top)
                    .padding(.horizontal)
                
                Text("\(Int(game.duration/(60*60))) horas \(Int((game.duration/(60*60)).truncatingRemainder(dividingBy: 1) * 60)) minutos")
                    .font(.title2)
                    .fontWeight(.medium)
                    .rowStyle()
                
                Title(title: "Puntajes:")
                    .padding(.top)
                    .padding(.horizontal)
                
                ForEach(game.scores) { score in
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
        .navigationTitle("Partida \(game.date.formatted(date: .abbreviated, time: .omitted))")
    }
}

//#Preview {
//    let preview = Preview(Game.self)
//    return NavigationStack {
//        GameDetailView(game: Game.sampleGames[1])
//           .modelContainer(preview.container)
//    }
//}
