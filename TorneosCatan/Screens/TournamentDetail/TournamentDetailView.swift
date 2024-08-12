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
    @State var editTournament = false
    
    var body: some View {
        ScrollView {
            
            Button {
                addGame = true
            } label: {
                Text("Nueva partida")
                    .frame(width: 250, height: 25)
            }
            .buttonStyle(TCButtonStyle())
            .padding()
            
            if !tournament.games.isEmpty {
                TournamentRankingView(tournament: tournament)
                    .padding(.top)
                
                TournamentScoresView(tournament: tournament)
                    .padding(.top)
                
                TournamentGamesView(tournament: tournament)
                    .padding(.top)
            }

            TournamentPlayersView(tournament: tournament)
                .padding(.top)
            
            Spacer()
        }
        .sheet(isPresented: $addGame) {
            NewGameView(tournament: tournament)
        }
        .sheet(isPresented: $editTournament) {
            EditTournamentView(tournament: tournament)
                .presentationDetents([.height(200)])
        }
        .navigationTitle(tournament.name)
        .toolbar {
            Button("Edit") {
                editTournament = true
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return NavigationStack {
//        TournamentDetailView(tournament: Tournament.sampleTournaments[0])
//            .modelContainer(preview.container)
//    }
//}
