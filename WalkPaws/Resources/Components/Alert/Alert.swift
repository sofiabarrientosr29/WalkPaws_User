//
//  Alert.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 27/6/26.
//

import UIKit

extension UIViewController
{
    func validateFields(_ fields: UIView...) -> Bool
    {
        for field in fields
        {
            guard let textField = field.subviews.first(where: { $0 is UITextField }) as? UITextField else {
                continue
            }
            
            if textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
            {
                textField.becomeFirstResponder()
                return false
            }
        }
        
        return true
    }
    
    func showAlert(title: String, description: String)
    {
        let alert = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        present(alert, animated: true)
    }
}
