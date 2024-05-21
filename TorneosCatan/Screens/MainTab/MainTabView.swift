//
//  MainTabView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TournamentListView()
                .tabItem { Label("Torneos", systemImage: "trophy.fill") }
            
            PlayerListView()
                .tabItem { Label("Jugadores", systemImage: "person.fill") }
        }
    }
}

#Preview {
    let preview = Preview(Tournament.self, Player.self)
    preview.addSamples(Tournament.sampleTournaments)
    preview.addSamples(Player.samplePlayes)
    return MainTabView()
        .modelContainer(preview.container)
}
