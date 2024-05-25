//
//  EditGameView.swift
//  TorneosCatan
//
//  Created by coni garcia on 25/05/2024.
//

import SwiftUI

struct EditGameView: View {
    @Environment(\.dismiss) private var dismiss

    @Bindable var game: Game
    
    @State var date = Date()
    @State var start = Date()
    @State var end = Date()
    
    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    GroupBox {
                        DatePicker("Fecha", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                        
                        DatePicker("Hora inicio", selection: $start, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                        
                        DatePicker("Hora fin", selection: $end, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Editar partida")
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
                        var duration = start.distance(to: end)
                        if duration < 0 { duration = 60*60*24 + duration }
                        game.date = date
                        game.duration = duration
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }

            }
        }
        .onAppear {
            date = game.date
            end = start.addingTimeInterval(game.duration)
        }
    }
}

//#Preview {
//    EditGameView()
//}
