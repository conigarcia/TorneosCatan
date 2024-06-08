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
    @State var end = Date()
    @State var points = [String](repeating: "", count: 6)
    @State var bank: Player?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    GroupBox {
                        DatePicker("Fecha", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                        
                        DatePicker("Hora inicio", selection: $date, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                        
                        DatePicker("Hora fin", selection: $end, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.compact)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .onChange(of: date) { oldValue, newValue in
                        end = date.addingTimeInterval(game.duration)
                    }
                    
                    ForEach(Array(game.scores.enumerated()), id: \.offset) { (idx, score) in
                        HStack {
                            HStack {
                                PlayerRowView(player: score.player!)
                                
                                Spacer()
                                
                                Button {
                                    bank = score.player
                                } label: {
                                    Text("banco")
                                        .font(.body.smallCaps())
                                        .fontWeight(bank == score.player ? .bold : .medium)
                                        .foregroundStyle(bank == score.player ? Color(.accent) : Color(.tertiaryLabel))
                                }
                            }
                            .rowStyle()
                            
                            TextField("", text: $points[idx])
                                .fontWeight(.medium)
                                .textFieldStyle(TCTextFieldStyle())
                                .keyboardType(.numberPad)
                                .frame(width: 50)
                                .padding(.trailing)
                        }
                    }

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
                        var duration = date.distance(to: end)
                        if duration < 0 { duration = 60*60*24 + duration }
                        game.date = date
                        game.duration = duration
                        game.bank = bank
                        for (idx, score) in game.scores.enumerated() {
                            score.score = Int(points[idx]) ?? 0
                        }
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                    .disabled(!points.allSatisfy { pt in pt != "" })
                }

            }
        }
        .onAppear {
            date = game.date
            end = date.addingTimeInterval(game.duration)
            bank = game.bank
            for (idx, score) in game.scores.enumerated() {
                points[idx] = String(score.score)
            }
        }
    }
}

//#Preview {
//    EditGameView()
//}
