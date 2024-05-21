//
//  NewTournamentView.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import SwiftData
import SwiftUI

struct NewTournamentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \Player.name) private var all_players: [Player]

    @State var name = ""
    @State var players: Set<Player> = []

    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    TextField("Nombre", text: $name)
                        .textFieldStyle(TCTextFieldStyle())
                    
                    MultiSelector(
                        label: Text("Jugadores"),
                        message: "seleccioná entre 3 y 6 jugadores",
                        options: all_players,
                        optionToString: {$0.name},
                        selected: $players
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Nuevo torneo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newTournament = Tournament(name: name, players: Array(players))
                        modelContext.insert(newTournament)
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                    .disabled(name.isEmpty || !(3...6 ~= players.count))
                }
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addSamples(Player.samplePlayes)
    return Text("")
        .sheet(isPresented: .constant(true)) {
            NewTournamentView()
                .presentationDetents([.medium])
        }
        .modelContainer(preview.container)
}
