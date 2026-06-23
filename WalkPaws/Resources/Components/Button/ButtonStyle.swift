//
//  ButtonStyle.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

struct ButtonStyle
{
    let font: UIFont
    let titleColor: UIColor
    let titleColorOn: UIColor
    let backgroundColor: UIColor
    let backgroundColorOn: UIColor
    let borderColor: UIColor
    let borderColorOn: UIColor
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let hasShadow: Bool
    
    init(font: UIFont = Fonts.Manrope.bold(16), titleColor: UIColor = Colors.white, titleColorOn: UIColor = Colors.white, backgroundColor: UIColor = .clear, backgroundColorOn: UIColor = .clear, borderColor: UIColor = .clear, borderColorOn: UIColor = .clear, borderWidth: CGFloat = 0, cornerRadius: CGFloat = 0, hasShadow: Bool = false)
    {
        self.font = font
        self.titleColor = titleColor
        self.titleColorOn = titleColorOn
        self.backgroundColor = backgroundColor
        self.backgroundColorOn = backgroundColorOn
        self.borderColor = borderColor
        self.borderColorOn = borderColorOn
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.hasShadow = hasShadow
    }
}
