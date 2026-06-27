//
//  FieldStyle.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

struct FieldStyle
{
    let backgroundColor: UIColor?
    let iconTintColor: UIColor?
    let font: UIFont?
    let textColor: UIColor?
    let placeholderFont: UIFont?
    let placeholderColor: UIColor?
    let borderColor: UIColor?
    let borderWidth: CGFloat?
    let cornerRadius: CGFloat?
    let hasShadow: Bool
    
    init(backgroundColor: UIColor? = nil, iconTintColor: UIColor? = nil, font: UIFont? = nil, textColor: UIColor? = nil, placeholderFont: UIFont? = nil, placeholderColor: UIColor? = nil, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil, cornerRadius: CGFloat? = nil, hasShadow: Bool = false)
    {
        self.backgroundColor = backgroundColor
        self.iconTintColor = iconTintColor
        self.font = font
        self.textColor = textColor
        self.placeholderFont = placeholderFont
        self.placeholderColor = placeholderColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.hasShadow = hasShadow
    }
}
