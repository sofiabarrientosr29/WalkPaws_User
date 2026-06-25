//
//  ExtensionField.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

extension UIView {
    
    func applyFieldStyle(_ style: FieldStyle, placeholder: String? = nil, icon: String? = nil)
    {
        backgroundColor = style.backgroundColor
        
        layer.cornerRadius = style.cornerRadius ?? 0
        layer.borderWidth = style.borderWidth ?? 0
        layer.borderColor = style.borderColor?.cgColor
        clipsToBounds = !style.hasShadow
        
        if style.hasShadow
        {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.12
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 8
        }
        
        addIcon(icon, tintColor: style.iconTintColor)
        addTextField(style, placeholder: placeholder, hasIcon: icon != nil)
    }
    
    private func addIcon(_ iconName: String?, tintColor: UIColor?)
    {
        guard let iconName, let image = UIImage(named: iconName) else { return }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addTextField(_ style: FieldStyle, placeholder: String?, hasIcon: Bool)
    {
        let textField = UITextField()
        textField.font = style.font
        textField.textColor = style.textColor
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        
        if let placeholder
        {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    .font: style.placeholderFont ?? style.font ?? UIFont.systemFont(ofSize: 15),
                    .foregroundColor: style.placeholderColor ?? UIColor.lightGray
                ]
            )
        }
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hasIcon ? 47 : 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
