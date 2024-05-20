//
//  TorneosCatanApp.swift
//  TorneosCatan
//
//  Created by coni garcia on 18/05/2024.
//

import SwiftData
import SwiftUI

@main
struct TorneosCatanApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerListView()
        }
        .modelContainer(for: Player.self)
    }
}
