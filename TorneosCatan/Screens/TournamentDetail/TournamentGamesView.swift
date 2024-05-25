//
//  TournamentGamesView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct TournamentGamesView: View {
    @Bindable var tournament: Tournament
    
    var body: some View {
        VStack {
            Title(title: "Partidas")
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                ForEach(tournament.games.sorted {$0.date > $1.date}.prefix(3)) { game in
                    NavigationLink {
                        GameDetailView(game: game)
                    } label: {
                        HStack {
                            GameRowView(game: game)
                            
                            Spacer()
                            
                            ListArrow()
                        }
                        .rowStyle()
                    }
                }
                
                if tournament.games.count > 3 {
                    NavigationLink {
                        GameListView(tournament: tournament)
                    } label: {
                        HStack {
                            Text("Ver más")
                                .foregroundStyle(Color(.secondaryLabel))
                            
                            Spacer()
                            
                            ListArrow()
                        }
                        .rowStyle()
                    }
                }
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return TournamentGamesView(tournament: Tournament.sampleTournaments[1])
//        .modelContainer(preview.container)
//}
