//
//  NewPlayerView.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import SwiftUI

struct NewPlayerView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State var name = ""
    @State var color: PlayerColor = .red

    var body: some View {
        NavigationStack {
            Group {
                HStack(spacing: 20) {
                    TextField("Nombre", text: $name)
                        .textFieldStyle(TCTextFieldStyle())
                    
                    TCColorPicker(color: $color)
                }
                .padding()
            }
            .navigationTitle("Nuevo jugador")
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
                        let newPlayer = Player(name: name, color: color)
                        modelContext.insert(newPlayer)
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    Text("")
        .sheet(isPresented: .constant(true)) {
            NewPlayerView()
                .presentationDetents([.height(250)])
        }
}
