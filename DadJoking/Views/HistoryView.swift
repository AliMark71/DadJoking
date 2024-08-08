//
//  HistoryView.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    static var descriptor: FetchDescriptor<Joke> {
        var descriptor = FetchDescriptor<Joke>(sortBy: [SortDescriptor(\Joke.timestamp, order: .reverse)])
        descriptor.fetchOffset = 1
        return descriptor
    }
    
    @Environment(\.modelContext) private var modelContext
    @Query(descriptor) private var jokes: [Joke]
    
    var body: some View {
        NavigationStack {
            List(jokes) { joke in
                NavigationLink(destination: { JokeView(joke: joke.toDTO()) }) {
                    HistoryRow(joke: joke.joke, timestamp: joke.timestamp)
                }
            }
        }
    }
}

#Preview {
    let previewUtils = PreviewUtils()
    HistoryView()
        .modelContainer(previewUtils.container)
}
