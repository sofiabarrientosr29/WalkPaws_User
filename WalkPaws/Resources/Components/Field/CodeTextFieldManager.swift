//
//  CodeTextFieldManager.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 25/6/26.
//

import UIKit

final class CodeTextFieldManager: NSObject, UITextFieldDelegate
{
    private var textFields: [UITextField] = []
    
    func configure(_ fields: [UIView?])
    {
        textFields.removeAll()
        
        for (index, fieldView) in fields.enumerated()
        {
            guard let fieldView else { continue }
            
            fieldView.layoutIfNeeded()
            fieldView.applyFieldStyle(FieldType.code)
            
            let textField = UITextField(frame: fieldView.bounds)
            textField.keyboardType = .numberPad
            textField.delegate = self
            textField.tag = index
            textField.backgroundColor = .clear
            textField.textAlignment = .center
            textField.font = Fonts.Manrope.bold(22)
            textField.textColor = Colors.darkGreen
            textField.tintColor = Colors.darkGreen
            textField.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            fieldView.addSubview(textField)
            textFields.append(textField)
        }
    }
    
    func getCode() -> String
    {
        return textFields.compactMap { $0.text }.joined()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        if string.isEmpty
        {
            textField.text = ""
            
            if textField.tag > 0
            {
                textFields[textField.tag - 1].becomeFirstResponder()
            }
            
            return false
        }
        
        guard string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            return false
        }
        
        textField.text = string
        
        let nextIndex = textField.tag + 1
        
        if nextIndex < textFields.count
        {
            textFields[nextIndex].becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        
        return false
    }
}
