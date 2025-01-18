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
    
    ///Converts a Double to a String with K, M, Bn, Tr, abbreviations.
    ///```
    ///Convert 12 to 12.0
    ///Convert 1234 to 1.23k
    ///Convert 123456 to 123.45k
    ///Convert 12345678 to 12.34M
    ///Convert 1234567890 to 1.23Bn
    ///Convert 123456789012 to 123.45Bn
    ///Convert 12345678901234 to 12.34Tr
    ///```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()
            
        default:
            return "\(sign)\(self)"
        }
    }
}
