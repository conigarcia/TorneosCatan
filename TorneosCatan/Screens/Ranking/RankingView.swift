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
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            
            Title(title: "\(tournament.games.sorted(by: {$0.date < $1.date})[games-1].date.formatted(date: .abbreviated, time: .omitted))")
                .padding(.horizontal)
            
            Chart {
                ForEach(tournament.scores(for: games).sorted {$0.1 > $1.1}, id: \.key) { player, score in
                    BarMark(
                        x: .value("Puntaje", score),
                        y: .value("Jugador", player.name),
                        width: .inset(4)
                    )
                    .annotation(position: .overlay) {
                        HStack {
                            Text("\(player.name)")
                            
                            Spacer()
                            
                            Text("\(score)")
                        }
                        .fontWeight(.semibold)
                        .padding()
                    }
                    .foregroundStyle(player.color.color)
                    .clipShape(.rect(bottomTrailingRadius: 8, topTrailingRadius: 8))
                }
            }
            .chartYAxis(.hidden)
            .frame(height: CGFloat(tournament.players.count * 60))
            .padding(.horizontal)
            .animation(.snappy, value: games)
            .onReceive(timer) { time in
                if play {
                    if games == tournament.games.count {
                        play = false
                    } else {
                        games += 1
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    games -= 1
                } label: {
                    Image(systemName: "arrow.left")
                }
                .disabled(games == 1 || play)
                
                Spacer()
                
                Button {
                    if games == tournament.games.count {
                        games = 1
                    }
                    play.toggle()
                } label: {
                    Image(systemName: "\(play ? "pause.fill" : "play.fill")")
                }
                
                Spacer()
                
                Button {
                    games += 1
                } label: {
                    Image(systemName: "arrow.right")
                }
                .disabled(games == tournament.games.count || play)
            }
            .font(.title)
            .fontWeight(.semibold)
            .rowStyle()
            .frame(height: 55)
            .padding(.vertical)
        }
        .navigationTitle("Historial de rankings")
    }
}

//#Preview {
//    RankingView()
//}
