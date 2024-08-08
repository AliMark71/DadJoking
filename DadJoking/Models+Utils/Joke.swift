//
//  Joke.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import Foundation
import SwiftData

@Model
public final class Joke {
    public var id: String
    public var joke: String
    public var status: Int
    public var timestamp: Date
    
    public init(id: String, joke: String, status: Int, timestamp: Date = Date()) {
        self.id = id
        self.joke = joke
        self.status = status
        self.timestamp = timestamp
    }
    
    public func toDTO() -> JokeDTO {
        .init(id: self.id, joke: self.joke, status: self.status, timestamp: timestamp)
    }
}

public struct JokeDTO: Sendable, Codable, Identifiable, Hashable {
    public let id: String
    public let joke: String
    public let status: Int
    public let timestamp: Date?
    
    public init(id: String, joke: String, status: Int, timestamp: Date = Date()) {
        self.id = id
        self.joke = joke
        self.status = status
        self.timestamp = timestamp
    }
    
    public func toModel() -> Joke {
        .init(id: id, joke: joke, status: status, timestamp: timestamp ?? Date())
    }
}

public enum JokeManager {
    public static func fetchJoke() async -> JokeDTO? {
        var request = URLRequest(url: URL(string: "https://icanhazdadjoke.com/")!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(JokeDTO.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}

