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
            if player.tournaments.isEmpty {
                Text("No participa de ningún torneo")
            } else {
                ForEach(player.tournaments) { tournament in
                    Text(tournament.name)
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
