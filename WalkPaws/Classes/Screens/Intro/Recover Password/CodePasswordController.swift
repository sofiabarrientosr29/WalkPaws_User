//
//  CodePasswordController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class CodePasswordController: UIViewController
{
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var fieldCode1: UIView!
    @IBOutlet weak var fieldCode2: UIView!
    @IBOutlet weak var fieldCode3: UIView!
    @IBOutlet weak var fieldCode4: UIView!
    @IBOutlet weak var fieldCode5: UIView!
    
    @IBOutlet weak var buttonConfirm: UIButton!
    
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var buttonCode: UIButton!
    
    private let codeManager = CodeTextFieldManager()
    var email: String?
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        labelTitle.font = Fonts.Manrope.bold(28)
        labelTitle.textColor = Colors.darkGreen
        labelTitle.text = "Código"
        
        labelDescription.setBoldHTML("Introduce el código enviado a <b>@gmail.com</b>", normalFont: Fonts.Manrope.extraLight(16), boldFont: Fonts.Manrope.bold(16), color: Colors.green)
        
        codeManager.configure([fieldCode1, fieldCode2, fieldCode3, fieldCode4, fieldCode5])
        
        buttonConfirm.applyStyle(ButtonType.primary)
        buttonConfirm.setTitle("Confirmar", for: .normal)
        
        labelCode.font = Fonts.Manrope.bold(17)
        labelCode.textColor = Colors.lightGreen
        labelCode.text = "¿No te ha llegado el código?"
        
        buttonCode.applyStyle(ButtonType.label)
        buttonCode.setTitle("Reenviar código", for: .normal)

    }
    
    // MARK: Buttons Methods
    @IBAction func confirmClicked(_ sender: Any)
    {
        let code = codeManager.getCode()
        
        if code.count != 5
        {
            showAlert(title: "Código incompleto", description: "Introduce los 5 números del código.")
            return
        }
        
        Task
        {
            do
            {
                try await AuthRequest.shared.verifyRecoveryCode(email: email ?? "", code: code)
                
                await MainActor.run
                {
                    let controller = ChangePasswordController.fromNib()
                    controller.email = self.email
                    self.pushController(controller)
                }
            }
            catch
            {
                await MainActor.run
                {
                    self.showAlert(title: "Código incorrecto", description: "El código no es válido o ha caducado.")
                }
            }
        }
    }
    
    @IBAction func resendCodeClicked(_ sender: Any)
    {
        Task
        {
            do
            {
                try await AuthRequest.shared.sendRecoveryCode(email: email ?? "")
                
                await MainActor.run
                {
                    self.showAlert(title: "Código enviado", description: "Te hemos enviado un nuevo código.")
                }
            }
            catch
            {
                await MainActor.run
                {
                    self.showAlert(title: "Error", description: "Ha habido un problema al enviar el correo")
                }
            }
        }
    }
    
}
