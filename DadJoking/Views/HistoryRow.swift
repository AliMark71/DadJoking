//
//  HistoryRow.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import SwiftUI

struct HistoryRow: View {
    let joke: String
    let timestamp: Date
    var jokeSlice: Substring {
        if let upperbound = joke.index(joke.startIndex,
                                       offsetBy: 25,
                                       limitedBy: joke.endIndex) {
            joke[joke.startIndex..<upperbound] + "..."
        } else {
            joke[joke.startIndex...]
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(jokeSlice)
                .font(.title2)
            Text(timestamp.ISO8601Format(.iso8601(timeZone: .current,
                                                  includingFractionalSeconds: false,
                                                  dateTimeSeparator: .space)))
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        
    }
}

#Preview {
    let joke = Joke.sample
    HistoryRow(joke: joke.joke, timestamp: joke.timestamp!)
}
