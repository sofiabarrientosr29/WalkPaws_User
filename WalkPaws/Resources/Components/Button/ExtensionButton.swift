//
//  AppButton.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

extension UIButton {
    
    func applyStyle(_ style: ButtonStyle)
    {
        titleLabel?.font = style.font
        
        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.titleColor, for: .highlighted)
        setTitleColor(style.titleColor, for: .selected)
        setTitleColor(style.titleColor, for: .disabled)
        
        tintColor = style.titleColor
        
        backgroundColor = style.backgroundColor
        
        layer.cornerRadius = style.cornerRadius
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        
        clipsToBounds = true
    }
}
