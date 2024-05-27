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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Player.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(sharedModelContainer)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
