//
//  EditTournamentView.swift
//  TorneosCatan
//
//  Created by coni garcia on 11/08/2024.
//

import SwiftUI

struct EditTournamentView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var tournament: Tournament
    
    @State var name = ""
    
    var body: some View {
        NavigationStack {
            Group {
                TextField("Nombre", text: $name)
                    .textFieldStyle(TCTextFieldStyle())
                    .padding()
            }
            .navigationTitle("Editar Torneo")
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
                        tournament.name = name
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
        .onAppear {
            name = tournament.name
        }
    }
}
