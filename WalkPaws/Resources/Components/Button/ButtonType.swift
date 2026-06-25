//
//  ButtonType.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class ButtonType
{
    static let primary = ButtonStyle(font: Fonts.Manrope.bold(20), titleColor: Colors.beis, backgroundColor: Colors.darkGreen, cornerRadius: 19)
    
    static let label = ButtonStyle(font: Fonts.Manrope.bold(15), titleColor: Colors.darkGreen)
    
    static let square = ButtonStyle(borderColor: Colors.darkGreen, borderWidth: 1.5, cornerRadius: 5)
}
