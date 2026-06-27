//
//  RegisterController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit
import Supabase

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
    
    @IBOutlet weak var buttonAccept: UIButton!
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
        
        labelDescription.font = Fonts.Manrope.medium(16)
        labelDescription.textColor = Colors.darkGreen
        labelDescription.text = "Únete a WalkPaws y empieza a hacer la diferencia"
        
        fieldName.applyFieldStyle(FieldType.primary, placeholder: "Nombre", icon: "icn_user")
        fieldSecondName.applyFieldStyle(FieldType.primary, placeholder: "Apellidos", icon: "icn_user")
        fieldEmail.applyFieldStyle(FieldType.primary, placeholder: "Correo electrónico", icon: "icn_email", type: .email)
        fieldPhone.applyFieldStyle(FieldType.primary, placeholder: "Número de teléfono", icon: "icn_phone", type: .phone)
        fieldPassword.applyFieldStyle(FieldType.primary, placeholder: "Contraseña", icon: "icn_lock", showEye: true, type: .password)
        fieldPasswordC.applyFieldStyle(FieldType.primary, placeholder: "Confirmar Contraseña", icon: "icn_lock", showEye: true, type: .password)
        
        buttonAccept.setImage(UIImage(named: "icn_square_empty"), for: .normal)
        labelTerms.setBoldHTML("Acepto la <b>Política de Privacidad</b>", normalFont: Fonts.Manrope.extraLight(13), boldFont: Fonts.Manrope.bold(13), color: Colors.green, underlineBold: true)
        
        buttonRegister.applyStyle(ButtonType.primary)
        buttonRegister.setTitle("Registrarse", for: .normal)
        
        hideKeyboardWhenTappedAround()
        observeKeyboard()
    }

    // MARK: Buttons Methods
    @IBAction func acceptClicked(_ sender: Any)
    {
        isTermsAccepted.toggle()
        
        let imageName = isTermsAccepted ? "icn_square_fill" : "icn_square_empty"
        buttonAccept.setImage(UIImage(named: imageName), for: .normal)
    }
    
    
    @IBAction func registerClicked(_ sender: Any)
    {
        if !validateFields(fieldName, fieldSecondName, fieldEmail, fieldPhone, fieldPassword, fieldPasswordC)
        {
            showAlert(title: "Campos incompletos", description: "Por favor, rellena todos los campos.")
            return
        }
        
        if !isTermsAccepted
        {
            showAlert(title: "Política de privacidad", description: "Debes aceptar la política de privacidad.")
            return
        }
        
        if !isValidEmail(fieldEmail.value)
        {
            showAlert(title: "Email no válido", description: "Por favor, introduce un correo electrónico válido.")
            return
        }
        
        if fieldPassword.value != fieldPasswordC.value
        {
            showAlert(title: "Contraseñas distintas", description: "Las contraseñas no coinciden.")
            return
        }
        
        Task
        {
            do
            {
                try await AuthRequest.shared.register(firstName: fieldName.value, lastName: fieldSecondName.value, email: fieldEmail.value.lowercased(), phone: fieldPhone.value, password: fieldPassword.value)
                
                await MainActor.run
                {
                    self.showAlert(title: "Registro correcto", description: "Usuario creado correctamente.")
                }
            }
        }
    }
}
