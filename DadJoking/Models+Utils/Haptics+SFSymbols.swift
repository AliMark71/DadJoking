//
//  Haptics+SFSymbols.swift
//  DadJoking
//
//  Created by Ali AlSalman on 08/08/2024.
//

import Foundation
import UIKit

@MainActor
enum Haptics {
    static let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    static func impact() {
        feedbackGenerator.impactOccurred()
    }
}

enum SFSymbols: String {
    case historySymbol = "clock.arrow.2.circlepath"
}
