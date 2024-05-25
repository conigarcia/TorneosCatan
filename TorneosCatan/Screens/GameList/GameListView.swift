//
//  GameListView.swift
//  TorneosCatan
//
//  Created by coni garcia on 25/05/2024.
//

import SwiftData
import SwiftUI

struct GameListView: View {
    let tournament: Tournament
    
    var body: some View {
        ScrollView {
            ForEach(tournament.games.sorted {$0.date > $1.date}) { game in
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
        }
        .navigationTitle("Partidas")
    }
}

//#Preview {
//    GameListView()
//}
