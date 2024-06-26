//
//  NewGameView.swift
//  TorneosCatan
//
//  Created by coni garcia on 23/05/2024.
//

import SwiftUI

struct NewGameView: View {
    @Environment(\.dismiss) private var dismiss

    @Bindable var tournament: Tournament
    
    @State var date = Date()
    @State var end = Date()
    @State var players = [Player]()
    @State var points = [String]()
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
                    
                    ForEach(Array(players.enumerated()), id: \.offset) { (idx, player) in
                        HStack {
                            HStack {
                                PlayerRowView(player: player)
                                
                                Spacer()
                                
                                Button {
                                    bank = player
                                } label: {
                                    Text("banco")
                                        .font(.body.smallCaps())
                                        .fontWeight(bank == player ? .bold : .medium)
                                        .foregroundStyle(bank == player ? Color(.accent) : Color(.tertiaryLabel))
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
            .navigationTitle("Nueva partida")
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
                        let game = Game(date: date, duration: duration, bank: bank)

                        for (idx, player) in players.enumerated() {
                            let score = Score(score: Int(points[idx]) ?? 0)
                            player.scores.append(score)
                            game.scores.append(score)
                        }

                        tournament.games.append(game)
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                    .disabled(!points.allSatisfy { pt in pt != "" })
                }
            }
        }
        .onAppear {
            for player in tournament.players {
                players.append(player)
                points.append("")
            }
            end = date
        }
    }
}

//#Preview {
//    let preview = Preview(Tournament.self)
//    return Text("")
//        .sheet(isPresented: .constant(true)) {
//            NewGameView(tournament: Tournament.sampleTournaments[0])
//        }
//        .modelContainer(preview.container)
//}
