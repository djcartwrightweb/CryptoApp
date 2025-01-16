//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle().foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    Group {
        CircleButtonView(iconName: "info")
            
        CircleButtonView(iconName: "plus")
            .colorScheme(.dark)
    }
        
}
