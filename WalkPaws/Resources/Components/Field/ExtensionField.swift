//
//  ExtensionField.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

enum FieldInputType
{
    case normal
    case email
    case phone
    case password
}

extension UIView: UITextFieldDelegate {
    
    func applyFieldStyle(_ style: FieldStyle, placeholder: String? = nil, icon: String? = nil, showEye: Bool = false, type: FieldInputType = .normal)
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
        addTextField(style, placeholder: placeholder, hasIcon: icon != nil, showEye: showEye, type: type)
    }
    
    private func addTextField(_ style: FieldStyle, placeholder: String?, hasIcon: Bool, showEye: Bool, type: FieldInputType)
    {
        let textField = UITextField()
        textField.font = style.font
        textField.textColor = style.textColor
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        
        configureTextFieldType(textField, type: type)
        
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
        
        textField.isSecureTextEntry = showEye
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        if showEye
        {
            addEyeIcon(textField, tintColor: style.iconTintColor)
        }
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hasIcon ? 47 : 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: showEye ? -47 : -16),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
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
    
    private func addEyeIcon(_ textField: UITextField, tintColor: UIColor?)
    {
        guard let image = UIImage(named: "icn_eye_close") else { return }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = tintColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility(_:)))
        imageView.addGestureRecognizer(tap)
        
        imageView.tag = textField.hash
    }
        
    @objc private func togglePasswordVisibility(_ gesture: UITapGestureRecognizer)
    {
        guard let imageView = gesture.view as? UIImageView else { return }

        let textField = subviews
            .compactMap { $0 as? UITextField }
            .first { $0.hash == imageView.tag }

        guard let textField else { return }

        textField.isSecureTextEntry.toggle()

        let imageName = textField.isSecureTextEntry ? "icn_eye_close" : "icn_eye_open"
        imageView.image = UIImage(named: imageName)
    }
    
    private func configureTextFieldType(_ textField: UITextField, type: FieldInputType)
    {
        switch type
        {
        case .normal:
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.autocapitalizationType = .sentences
            
        case .email:
            textField.keyboardType = .emailAddress
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.textContentType = .emailAddress
            
        case .phone:
            textField.keyboardType = .phonePad
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.textContentType = .telephoneNumber
            textField.text = "+"
            textField.delegate = self
            
        case .password:
            textField.keyboardType = .default
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.textContentType = .password
            textField.isSecureTextEntry = true
        }
    }
    
    var textField: UITextField?
    {
        return subviews.first(where: { $0 is UITextField }) as? UITextField
    }

    var value: String
    {
        return textField?.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
}
