//
//  CardView.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import SwiftUI
import CoreHaptics

struct CardView: View {
    @Environment(\.modelContext) private var modelContext
    
    let joke: JokeDTO?
    @Binding var jokes: [JokeDTO?]
    @State private var expandable = true
    @State private var expanded   = false
    @State private var offset: CGSize = .zero
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 320, height: 550)
                .cornerRadius(20)
                .foregroundColor(.purple)
                .shadow(radius: 10)
                .overlay(Text(joke?.joke ?? "womp womp, no joke for you")
                    .font(.largeTitle)
                    .bold()
                    .frame(alignment: .center)
                    .lineSpacing(7))
                .offset(x: offset.width, y: offset.height * 0.4)
                .rotationEffect(.degrees(Double(offset.width / 40)))
                .gesture(DragGesture().onChanged{ gesture in
                    offset = gesture.translation
                }.onEnded { _ in
                    withAnimation {
                        swipeCard(weidth: offset.width)
                    }
                })
            if expandable {
                Button(action: { expanded = true }) {
                    Text("expand")
                }
            }
        }
        .sheet(isPresented: $expanded) {
            JokeView(joke: joke)
        }
        
    }
    
    func swipeCard(weidth: CGFloat) {
        switch weidth {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            Task {
                await cardDropped()
            }
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            Task {
                await cardDropped()
            }
        default:
            offset = .zero
        }
    }
    
    func cardDropped() async {
        Haptics.impact()
        
        withAnimation(.interactiveSpring) { expandable = false }
        
        jokes.removeLast()
        
        if let top = jokes.last, let top {
            modelContext.insert(top.toModel())
        }
        
        jokes.insert(await JokeManager.fetchJoke(), at: 0)
    }
}

#Preview {
    let joke = Joke.sample
    CardView(joke: joke,
             jokes: .init(get: {Joke.samples},
                          set: {_ in })
    )
}
