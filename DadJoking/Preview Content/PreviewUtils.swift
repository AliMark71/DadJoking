//
//  PreviewUtils.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import Foundation
import SwiftData

@MainActor
struct PreviewUtils {
    let container: ModelContainer
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: Joke.self, configurations: config)
        } catch {
            fatalError("Could not create preview container")
        }
        
        self.addExamples(Joke.samples.map { $0.toModel() })
    }
    
    func addExamples(_ examples: [Joke]) {
        examples.forEach { example in
            container.mainContext.insert(example)
        }
    }
}
