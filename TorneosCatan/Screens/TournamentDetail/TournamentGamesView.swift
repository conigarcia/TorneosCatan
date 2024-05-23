//
//  TournamentGamesView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct TournamentGamesView: View {
    let tournament: Tournament
    
    var body: some View {
        Title(title: "Partidas")
            .padding(.horizontal)
            .padding(.top)
        
        VStack(alignment: .leading) {
            ForEach(tournament.games) { game in
                NavigationLink {
                    GameDetailView(game: game)
                } label: {
                    HStack {
                        Text("\(game.date.formatted(date: .abbreviated, time: .omitted))")
                            .foregroundStyle(Color(.label))
                        
                        Spacer()
                        
                        ListArrow()
                    }
                    .rowStyle()
                }
            }
        }
    }
}

//#Preview {
//    TournamentGamesView()
//}
