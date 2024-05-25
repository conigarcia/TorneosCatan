//
//  GameRowView.swift
//  TorneosCatan
//
//  Created by coni garcia on 25/05/2024.
//

import SwiftUI

struct GameRowView: View {
    let game: Game
    
    var body: some View {
        Text("\(game.date.formatted(date: .abbreviated, time: .omitted))")
            .foregroundStyle(Color(.label))
    }
}

//#Preview {
//    GameRowView()
//}
