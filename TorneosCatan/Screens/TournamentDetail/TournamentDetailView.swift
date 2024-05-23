//
//  TournamentDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct TournamentDetailView: View {
    @Bindable var tournament: Tournament
    
    @State var addGame = false
    
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    addGame = true
                } label: {
                    Text("Nueva partida")
                        .frame(width: 250, height: 25)
                }
                .buttonStyle(TCButtonStyle())
                .padding()
                
                TournamentPlayersView(tournament: tournament)
                
                TournamentGamesView(tournament: tournament)
                
                Spacer()
            }
        }
        .sheet(isPresented: $addGame) {
            NewGameView(tournament: tournament)
        }
        .navigationTitle(tournament.name)
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return NavigationStack {
//        TournamentDetailView(tournament: Tournament.sampleTournaments[0])
//            .modelContainer(preview.container)
//    }
//}
