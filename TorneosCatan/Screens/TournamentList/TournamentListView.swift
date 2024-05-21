//
//  TournamentListView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftData
import SwiftUI

struct TournamentListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tournaments: [Tournament]
    
    @State var addTournament = false
    
    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(tournaments) { tournament in
                        NavigationLink {
                            TournamentDetailView(tournament: tournament)
                        } label: {
                            TournamentRowView(tournament: tournament)
                        }
                    }
                    .onDelete(perform: deleteTournaments)
                }
            }
            .sheet(isPresented: $addTournament) {
                NewTournamentView()
                    .presentationDetents([.medium])
            }
            .navigationTitle("Torneos")
            .toolbar {
                Button {
                    addTournament = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                
                EditButton()
            }
        }
    }
    
    private func deleteTournaments(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tournaments[index])
            }
        }
    }
}

#Preview {
    let preview = Preview(Tournament.self)
    preview.addSamples(Tournament.sampleTournaments)
    return TournamentListView()
        .modelContainer(preview.container)
}
