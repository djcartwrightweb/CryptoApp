//
//  Double.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import Foundation

extension Double {
    
    ///Converts a Double into a currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormater2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.locale = .current // <- default value
        formatter.currencyCode = "CAD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Converts a Double into a currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        currencyFormater2.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    ///Converts a Double into a currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormater6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.locale = .current // <- default value
        formatter.currencyCode = "CAD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///Converts a Double into a currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        currencyFormater6.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    ///Converts a Double into a String representation with 2 decimal places
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asNumberString() -> String {
        String(format: "%.2f", self)
    }
    
    ///Converts a Double into a String representation of a percentage with 2 decimal places
    /// ```
    /// Convert 1.23456 to "1.23%"
    /// ```
    func asPercentageString() -> String {
        asNumberString() + "%"
    }
}
