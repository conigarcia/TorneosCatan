//
//  TournamentDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct TournamentDetailView: View {
    let tournament: Tournament
    
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    
                } label: {
                    Text("Nueva partida")
                        .frame(width: 250, height: 25)
                }
                .buttonStyle(TCButtonStyle())
                .padding()
                
                HStack {
                    Text("Jugadores")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    ForEach(tournament.players) { player in
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            HStack {
                                PlayerRowView(player: player)
                                    .foregroundStyle(player.color.color)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(Color(.tertiaryLabel))
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(.horizontal)
                        }
                    }
                }
                
                HStack {
                    Text("Partidas")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                VStack(alignment: .leading) {
                    ForEach(tournament.games) { game in
                        Text("\(game.date.formatted(date: .abbreviated, time: .omitted))")
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(tournament.name)
    }
}

//#Preview {
//    let preview = Preview(Tournament.self, Player.self)
//    preview.addSamples(Tournament.sampleTournaments)
//    return NavigationStack {
//        TournamentDetailView(tournament: Tournament.sampleTournaments[0])
//            .modelContainer(preview.container)
//    }
//}
