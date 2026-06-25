//
//  ExtensionLabel.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

extension UILabel
{
    
    func setBoldHTML(_ text: String, normalFont: UIFont, boldFont: UIFont,color: UIColor, underlineBold: Bool = false)
    {
        let result = NSMutableAttributedString()
        var remaining = text
        
        while let start = remaining.range(of: "<b>"),
              let end = remaining.range(of: "</b>") {
            
            let before = String(remaining[..<start.lowerBound])
            let bold = String(remaining[start.upperBound..<end.lowerBound])
            
            result.append(NSAttributedString(
                string: before,
                attributes: [.font: normalFont, .foregroundColor: color]
            ))
            
            var boldAttributes: [NSAttributedString.Key: Any] = [
                .font: boldFont,
                .foregroundColor: color
            ]

            if underlineBold {
                boldAttributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
            }

            result.append(NSAttributedString(
                string: bold,
                attributes: boldAttributes
            ))
            
            remaining = String(remaining[end.upperBound...])
        }
        
        result.append(NSAttributedString(
            string: remaining,
            attributes: [.font: normalFont, .foregroundColor: color]
        ))
        
        attributedText = result
    }
}
