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
    
    @State var expanded = false
    
    var body: some View {
        ScrollView {
            ForEach(tournament.games.sorted {$0.date > $1.date}) { game in
                NavigationLink {
                    GameDetailView(game: game)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            GameRowView(game: game)
                            
                            if expanded {
                                HStack {
                                    ForEach(game.scores.sorted {$0.player!.name < $1.player!.name}) { score in
                                        Text("\(score.player!.name.prefix(2)): \(score.score)")
                                            .font(.body.smallCaps())
                                            .fontWeight(.medium)
                                            .foregroundStyle(score.player!.color.color)
                                        Spacer()
                                    }
                                }
                                .padding(.top, 6)
                            }
                        }
                        
                        Spacer()
                        
                        ListArrow()
                    }
                    .rowStyle()
                }
            }
        }
        .navigationTitle("Partidas")
        .toolbar {
            Button("\(expanded ? "Contraer" : "Expandir")") {
                expanded.toggle()
            }
        }
    }
}

//#Preview {
//    GameListView()
//}
