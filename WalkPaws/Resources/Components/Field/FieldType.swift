//
//  FieldType.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class FieldType
{
    
    static let primary = FieldStyle(
        backgroundColor: Colors.grayGreen,
        iconTintColor: Colors.darkGreen,
        font: Fonts.Manrope.bold(15),
        textColor: Colors.darkGreen,
        placeholderFont: Fonts.Manrope.regular(15),
        placeholderColor: Colors.lightGreyGreen,
        cornerRadius: 13
    )
    
    static let primarySmall = FieldStyle(
        backgroundColor: Colors.grayGreen,
        iconTintColor: Colors.darkGreen,
        font: Fonts.Manrope.bold(15),
        textColor: Colors.darkGreen,
        placeholderFont: Fonts.Manrope.regular(12),
        placeholderColor: Colors.lightGreyGreen,
        cornerRadius: 13
    )
}
