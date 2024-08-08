//
//  DadJokingTests.swift
//  DadJokingTests
//
//  Created by Ali AlSalman on 08/08/2024.
//

import Testing
@testable import DadJoking

struct DadJokingTests {

    @Test()
    func timeFetchJoke() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let joke = await DadJoking.JokeManager.fetchJoke()
        #expect(joke != nil, "on normal internet connection, we should get a joke back")
    }

}
