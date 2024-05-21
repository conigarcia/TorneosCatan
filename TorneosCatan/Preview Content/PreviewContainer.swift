//
//  PreviewContainer.swift
//  TorneosCatan
//
//  Created by coni garcia on 20/05/2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create preview container")
        }
    }
    
    func addSamples(_ samples: [any PersistentModel]) {
        Task { @MainActor in
            samples.forEach { sample in
                container.mainContext.insert(sample)
            }
        }
    }
}
