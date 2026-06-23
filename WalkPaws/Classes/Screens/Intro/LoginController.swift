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
        
        fieldEmail.applyFieldStyle(FieldType.primary, placeholder: "Correo electrónico", icon: "icn_email")
        fieldPassword.applyFieldStyle(FieldType.primary, placeholder: "Contraseña", icon: "icn_lock")
        
        labelForgetPassword.font = Fonts.Manrope.semiBold(15)
        labelForgetPassword.textColor = Colors.darkGreen
        labelForgetPassword.text = "Contraseña olvidada"
        
        buttonEnter.applyStyle(ButtonType.primary)
        buttonEnter.setTitle("Entrar", for: .normal)
        
    }

    // MARK: Buttons Methods
    @IBAction func recoverPasswordClicked(_ sender: Any)
    {
        pushController(RecoverPasswordController.fromNib())
    }
    
}
