//
//  TournamentRowView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct TournamentRowView: View {
    let tournament: Tournament

    var body: some View {
        Text(tournament.name)
            .fontWeight(.medium)
    }
}

#Preview {
    let preview = Preview(Tournament.self)
    return TournamentRowView(tournament: Tournament.sampleTournaments[0])
        .modelContainer(preview.container)
}
