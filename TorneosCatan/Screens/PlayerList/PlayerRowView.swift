//
//  PlayerRowView.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import SwiftUI

struct PlayerRowView: View {
    let player: Player
    
    var body: some View {
        Text(player.name)
            .fontWeight(.medium)
    }
}

#Preview {
    let preview = Preview(Player.self)
    return PlayerRowView(player: Player.samplePlayes[0])
        .modelContainer(preview.container)
}
