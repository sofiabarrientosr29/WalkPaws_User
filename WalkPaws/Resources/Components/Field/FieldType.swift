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
    
    static let code = FieldStyle(
        backgroundColor: Colors.grayGreen,
        font: Fonts.Manrope.bold(22),
        textColor: Colors.black,
        borderColor: Colors.lightGreen,
        borderWidth: 1,
        cornerRadius: 14
    )
}
