//
//  ChangePasswordController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class ChangePasswordController: UIViewController
{
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var fieldPassword: UIView!
    @IBOutlet weak var fieldPasswordC: UIView!
    
    @IBOutlet weak var buttonConfirm: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Nueva Contraseña"
        
        labelDescription.font = Fonts.Manrope.medium(16)
        labelDescription.textColor = Colors.green
        labelDescription.text = "Introduce tu nueva contraseña para acceder a tu cuenta"
        
        fieldPassword.applyFieldStyle(FieldType.primary, placeholder: "Contraseña", icon: "icn_lock", showEye: true,type: .password)
        fieldPasswordC.applyFieldStyle(FieldType.primary, placeholder: "Confirmar Contraseña", icon: "icn_lock", showEye: true, type: .password)
        
        buttonConfirm.applyStyle(ButtonType.primary)
        buttonConfirm.setTitle("Confirmar", for: .normal)
        
    }

    @IBAction func confirmClicked(_ sender: Any)
    {
        
    }
    
}
