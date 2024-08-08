//
//  ContentView.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @State var jokes: [JokeDTO?] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(jokes, id: \.self) { joke in
                        CardView(joke: joke, jokes: $jokes)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: HistoryView.init) {
                        Label("View Joke History", systemImage: SFSymbols.historySymbol.rawValue)
                    }
                }
            }
        }
        .task {
            let (top, back) = await (JokeManager.fetchJoke(), JokeManager.fetchJoke())
            jokes.append(back)
            jokes.append(top)
            
            if let top { modelContext.insert(top.toModel()) }
        }
    }
    
    func viewHistory() {
        print("viewing history")
    }
}

#Preview {
    MainView()
        .modelContainer(for: Joke.self, inMemory: true)
}
