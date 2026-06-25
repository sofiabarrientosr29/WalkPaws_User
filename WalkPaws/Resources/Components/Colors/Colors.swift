//
//  Colors.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class Colors
{
    static let white = color("0xFFFFFF")
    static let black = color("0x000000")
    
    // Green
    static let darkGreen = color("325A4B")
    static let grayGreen = color("DEDFD8")
    static let lightGreyGreen = color("979891")
    static let lightGreen = color("668369")
    static let green = color("487162")
    
    static let beis = color("FCF7F1")
    
    // MARK: Creates a UIColor from a hexadecimal RGB value
    static func color(_ hex: String) -> UIColor {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        let rgb = Int(hex, radix: 16) ?? 0
        
        return UIColor(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: 1
        )
    }
}
