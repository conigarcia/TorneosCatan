//
//  PlayerDetailView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct PlayerDetailView: View {
    let player: Player

    var body: some View {
        Group {
            VStack {
                if player.scores.isEmpty {
                    Text("no scores")
                } else {
                    ForEach(player.scores) { score in
                        HStack {
                            Text(score.player.name)
                            Text("\(score.game?.date ?? Date())")
                            Text(score.game?.tournament?.name ?? "xx")
                            Text("\(score.score)")
                        }
                    }
                }
            }
        }
        .navigationTitle(player.name)
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {
        PlayerDetailView(player: Player.samplePlayes[0])
            .modelContainer(preview.container)
    }
}
