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
        } else {
            let hoursString = hours == 1 ? "hora" : "horas"
            let minutesString = minutes == 1 ? "minuto" : "minutos"
            return "\(hours) \(hoursString) \(minutes == 0 ? "" : "\(minutes) \(minutesString)")"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Title(title: "Duración:")
                    .padding(.top)
                    .padding(.horizontal)
                
                Text(durationString)
                    .font(.title2)
                    .fontWeight(.medium)
                    .rowStyle()
                
                if let bank = game.bank {
                    Title(title: "Banco:")
                        .padding(.top)
                        .padding(.horizontal)
                    
                    Text("\(bank.name)")
                        .font(.title2)
                        .fontWeight(.medium)
                        .rowStyle()
                }
                
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
                .presentationDetents([.height(300)])
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
