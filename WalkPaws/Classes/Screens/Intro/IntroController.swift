//
//  IntroController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class IntroController: UIViewController
{
    @IBOutlet weak var viewBottom: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    
    @IBOutlet weak var labelNew: UILabel!
    @IBOutlet weak var buttonRegister: UIButton!
    
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        viewBottom.layer.cornerRadius = 35
        viewBottom.clipsToBounds = true
        
        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Paseos que cambian vidas"
        
        labelDescription.font = Fonts.Manrope.bold(18)
        labelDescription.textColor = Colors.green
        labelDescription.text = "Conecta con perros de refugios y ayúdales con el paseo que tanto necesitan"
        
        buttonStart.applyStyle(ButtonType.primary)
        buttonStart.setTitle("Comenzar", for: .normal)
        
        labelNew.font = Fonts.Manrope.bold(17)
        labelNew.textColor = Colors.lightGreen
        labelNew.text = "¿Eres nuevo aquí?"
        
        buttonRegister.applyStyle(ButtonType.label)
        buttonRegister.setTitle("Regístrate", for: .normal)

    }
    
    // MARK: Buttons Methods
    @IBAction func startClicked(_ sender: Any)
    {
        pushController(LoginController.fromNib())
    }
    
    @IBAction func registerClicked(_ sender: Any)
    {
        pushController(RegisterController.fromNib())
    }
    
}
