//
//  PlayerListView.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import SwiftData
import SwiftUI

struct PlayerListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var players: [Player]

    @State var addPlayer = false

    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(players) { player in
                        NavigationLink {
                            Text(player.name)
                                .foregroundStyle(player.color.color)
                        } label: {
                            PlayerRowView(player: player)
                        }
                    }
                    .onDelete(perform: deletePlayers)
                }
            }
            .sheet(isPresented: $addPlayer) {
                NewPlayerView()
                    .presentationDetents([.height(250)])
            }
            .navigationTitle("Jugadores")
            .toolbar {
                Button {
                    addPlayer = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                
                EditButton()
            }
        }
    }
    
    private func deletePlayers(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(players[index])
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addSamples(Player.samplePlayes)
    return PlayerListView()
        .modelContainer(preview.container)
}
