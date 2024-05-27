//
//  RankingView.swift
//  TorneosCatan
//
//  Created by coni garcia on 26/05/2024.
//

import Charts
import SwiftUI

struct RankingView: View {
    let tournament: Tournament
    
    @State var games = 1
    @State var play = false

    var body: some View {
        VStack {
            Chart {
                ForEach(tournament.scores(for: games).sorted {$0.1 > $1.1}, id: \.key) { player, score in
                    BarMark(
                        x: .value("Puntaje", score),
                        y: .value("Jugador", player.name),
                        width: .inset(4)
                    )
                    .annotation(position: .overlay) {
                        NavigationLink {
                            Text("hola")
                        } label: {
                            HStack {
                                Text("\(player.name)")
                                
                                Spacer()
                                
                                Text("\(score)")
                            }
                            .fontWeight(.semibold)
                            .padding()
                        }
                    }
                    .foregroundStyle(player.color.color)
                    .clipShape(.rect(bottomTrailingRadius: 8, topTrailingRadius: 8))
                }
            }
            .chartYAxis(.hidden)
            .frame(height: CGFloat(tournament.players.count * 60))
            .padding(.horizontal)
            .animation(.snappy, value: games)
            
            HStack {
                Button {
                    games -= 1
                } label: {
                    Image(systemName: "arrow.left")
                }
                .disabled(games == 1)
                
                Spacer()
                
                Button {
                    play.toggle()
                } label: {
                    Image(systemName: "\(play ? "pause.fill" : "play.fill")")
                }
                .animation(.none, value: play)
                
                Spacer()

                Button {
                    games += 1
                } label: {
                    Image(systemName: "arrow.right")
                }
                .disabled(games == tournament.games.count)
            }
            .font(.title)
            .fontWeight(.semibold)
            .rowStyle()
            .frame(height: 55)
            .padding(.top)
        }
        .navigationTitle("Historial de rankings")
    }
}

//#Preview {
//    RankingView()
//}
