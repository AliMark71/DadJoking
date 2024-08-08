//
//  JokeView.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import SwiftUI

struct JokeView: View {
    let joke: JokeDTO?
    var body: some View {
        Text(joke?.joke ?? "womp womp, no joke for you")
            .bold()
    }
}

#Preview {
    JokeView(joke: Joke.sample)
}
