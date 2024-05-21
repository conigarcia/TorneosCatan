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
            Text(player.name)
                .foregroundStyle(player.color.color)
                .fontWeight(.bold)
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
