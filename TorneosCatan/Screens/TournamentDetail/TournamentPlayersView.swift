//
//  TournamentPlayersView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct TournamentPlayersView: View {
    let tournament: Tournament
    
    var body: some View {
        Title(title: "Jugadores")
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
                        
                        ListArrow()
                    }
                    .rowStyle()
                }
            }
        }
    }
}

//#Preview {
//    TournamentPlayersView()
//}
