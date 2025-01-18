//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-18.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }

    }
}

#Preview {
    XMarkButton()
}
