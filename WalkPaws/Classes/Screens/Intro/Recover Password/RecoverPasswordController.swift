//
//  RecoverPasswordController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class RecoverPasswordController: UIViewController
{
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var fieldEmail: UIView!
    @IBOutlet weak var buttonCode: UIButton!
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Recuperar Contraseña"
        
        labelDescription.font = Fonts.Manrope.medium(16)
        labelDescription.textColor = Colors.green
        labelDescription.text = "Introduce tu correo electrónico y te enviaremos un código para recuperar el acceso a tu cuenta"
        
        fieldEmail.applyFieldStyle(FieldType.primary, placeholder: "Correo electrónico", icon: "icn_email")
        
        buttonCode.applyStyle(ButtonType.primary)
        buttonCode.setTitle("Enviar código", for: .normal)

    }
    
    // MARK: Buttons Methods
    @IBAction func codeClicked(_ sender: Any)
    {
        pushController(CodePasswordController.fromNib())
    }
    
    
}
