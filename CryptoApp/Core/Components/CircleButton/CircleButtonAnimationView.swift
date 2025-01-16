//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
        .foregroundStyle(.red)
}
