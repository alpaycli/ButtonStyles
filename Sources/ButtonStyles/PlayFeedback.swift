//
//  PlayFeedback.swift
//  ButtonStyles
//
//  Created by Alpay Calalli on 10.10.24.
//

import SwiftUI

struct PlayFeedback<Trigger: Equatable>: ViewModifier {
    let trigger: Trigger
    func body(content: Content) -> some View {
        if #available(iOS 17, *) {
            content
                .sensoryFeedback(.impact, trigger: trigger)
        } else {
            content
                .onChange(of: trigger) { _ in
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
        }
    }
}

extension View {
    func playFeedback<Trigger: Equatable>(trigger: Trigger) -> some View {
        modifier(PlayFeedback(trigger: trigger))
    }
}
