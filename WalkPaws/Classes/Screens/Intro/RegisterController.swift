//
//  RegisterController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class RegisterController: UIViewController
{
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var fieldName: UIView!
    @IBOutlet weak var fieldSecondName: UIView!
    @IBOutlet weak var fieldEmail: UIView!
    @IBOutlet weak var fieldPhone: UIView!
    @IBOutlet weak var fieldPassword: UIView!
    @IBOutlet weak var fieldPasswordC: UIView!
    
    @IBOutlet weak var buttonSelect: UIButton!
    @IBOutlet weak var buttonTerms: UIButton!
    @IBOutlet weak var labelTerms: UILabel!
    
    @IBOutlet weak var buttonRegister: UIButton!
    
    private var isTermsAccepted = false
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Crear Cuenta"
        
        labelDescription.font = Fonts.Manrope.medium(15)
        labelDescription.textColor = Colors.darkGreen
        labelDescription.text = "Únete a WalkPaws y empieza a hacer la diferencia"
        
        fieldName.applyFieldStyle(FieldType.primarySmall, placeholder: "Nombre", icon: "icn_user")
        fieldSecondName.applyFieldStyle(FieldType.primarySmall, placeholder: "Apellidos", icon: "icn_user")
        fieldEmail.applyFieldStyle(FieldType.primarySmall, placeholder: "Correo electrónico", icon: "icn_email")
        fieldPhone.applyFieldStyle(FieldType.primarySmall, placeholder: "Número de teléfono", icon: "icn_phone")
        fieldPassword.applyFieldStyle(FieldType.primarySmall, placeholder: "Contraseña", icon: "icn_lock")
        fieldPasswordC.applyFieldStyle(FieldType.primarySmall, placeholder: "Confirmar Contraseña", icon: "icn_lock")
        
        buttonSelect.applyStyle(ButtonType.square)
        buttonTerms.applyStyle(ButtonType.label)
        labelTerms.setBoldHTML("Acepto la <b>Política de Privacidad</b>", normalFont: Fonts.Manrope.extraLight(13), boldFont: Fonts.Manrope.bold(13), color: Colors.green, underlineBold: true)
        
        buttonRegister.applyStyle(ButtonType.primary)
        buttonRegister.setTitle("Registrarse", for: .normal)
        
        hideKeyboardWhenTappedAround()
        observeKeyboard()
    }

    // MARK: Buttons Methods
    @IBAction func registerClicked(_ sender: Any)
    {
        
    }
}
