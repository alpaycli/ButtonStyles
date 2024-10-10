//
//  DuolingoButtonStyle.swift
//  ButtonStyles
//
//  Created by Alpay Calalli on 10.10.24.
//

import SwiftUI

public struct DuolingoButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    private var shadowColor: Color
    private var backgroundColor: Color
    
    private var yOffset: CGFloat = 6
    
    init(
        backgroundColor: Color
    ) {
        if #available(iOS 18.0, *) {
            self.shadowColor = .black.mix(with: backgroundColor, by: 0.9)
        } else {
            self.shadowColor = .black.opacity(0.6)
        }
        self.backgroundColor = backgroundColor
    }
    
    init() {
        if #available(iOS 18.0, *) {
            self.shadowColor = .black.mix(with: .green, by: 0.9)
        } else {
            self.shadowColor = .black.opacity(0.6)
        }
        self.backgroundColor = .green
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            if isEnabled {
                if #available(iOS 18.0, *) {
                    buttonShape(color: configuration.role == .destructive ? .black.mix(with: .red, by: 0.9) : shadowColor)
                } else {
                    buttonShape(color: configuration.role == .destructive ? .black.opacity(0.6) : shadowColor)
                }
            }
            buttonShape(color: isEnabled ? configuration.role == .destructive ? .red : backgroundColor : .gray.opacity(0.4))
                .offset(y: configuration.isPressed ? 0 : -yOffset)
            
            configuration.label
//                .foregroundStyle(isEnabled ? .white : .gray.opacity(0.4))
                .offset(y: -yOffset)
                .offset(y: configuration.isPressed ? yOffset : 0)
                .playFeedback(trigger: configuration.isPressed)
            //                .sensoryFeedback(.impact, trigger: configuration.isPressed)
        }
    }
    
    
    @ViewBuilder
    private func buttonShape(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(color)
            .frame(maxWidth: .infinity - 40)
            .frame(height: 40)
    }
}

public extension ButtonStyle where Self == DuolingoButtonStyle {
    static var duolingo: DuolingoButtonStyle {
        DuolingoButtonStyle()
    }
}
