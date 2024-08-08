//
//  SampleJokes.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import Foundation

extension Joke {
    static let sample: JokeDTO = .init(id: "1", joke: "Why did the pony ask for a glass of water?\nBecause it was a little horse.", status: 0)
    static let samples: [JokeDTO] = [
        .init(id: "1", joke: "funny stuff", status: 0),
        .init(id: "2", joke: "more funny stuff", status: 0),
        .init(id: "3", joke: "yet more funny stuff", status: 0),
        .init(id: "4", joke: "one more thing, more funny stuff ", status: 0),
    ]
}
