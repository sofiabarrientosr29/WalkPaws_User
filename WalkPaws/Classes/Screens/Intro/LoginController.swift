//
//  LoginController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class LoginController: UIViewController
{
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var fieldEmail: UIView!
    @IBOutlet weak var fieldPassword: UIView!
    @IBOutlet weak var labelForgetPassword: UILabel!
    @IBOutlet weak var buttonEnter: UIButton!
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Iniciar Sesión"
        
        fieldEmail.applyFieldStyle(FieldType.primary, placeholder: "Correo electrónico", icon: "icn_email", type: .email)
        fieldPassword.applyFieldStyle(FieldType.primary, placeholder: "Contraseña", icon: "icn_lock", showEye: true, type: .password)
        
        labelForgetPassword.font = Fonts.Manrope.semiBold(16)
        labelForgetPassword.textColor = Colors.darkGreen
        labelForgetPassword.text = "Contraseña olvidada"
        
        buttonEnter.applyStyle(ButtonType.primary)
        buttonEnter.setTitle("Entrar", for: .normal)
        
    }

    // MARK: Buttons Methods
    @IBAction func recoverPasswordClicked(_ sender: Any)
    {
        let controller = RecoverPasswordController.fromNib()
        controller.email = fieldEmail.value
        pushController(controller)
    }
    
    @IBAction func enterClicked(_ sender: Any)
    {
        if !validateFields(fieldEmail, fieldPassword)
        {
            showAlert(title: "Campos incompletos", description: "Por favor, rellena todos los campos.")
            return
        }
        
        if !isValidEmail(fieldEmail.value)
        {
            showAlert(title: "Email no válido", description: "Por favor, introduce un correo electrónico válido.")
            return
        }
        
        Task
        {
            do
            {
                try await AuthRequest.shared.login(email: fieldEmail.value.lowercased(), password: fieldPassword.value)
                
                await MainActor.run
                {
                    self.showAlert(title: "Login correcto", description: "Has iniciado sesión correctamente.")
                    // self.pushController(HomeController.fromNib())
                }
            }
            catch
            {
                await MainActor.run
                {
                    self.showAlert(title: "Error", description: "Email o contraseña incorrectos.")
                }
            }
        }
    }
    
}
