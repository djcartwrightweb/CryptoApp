//
//  UIApplication.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-16.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    //this dismisses the keyboard if pressing the cancel button on the search bar
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
