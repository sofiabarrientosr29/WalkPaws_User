//
//  SplashController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class SplashController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
        {
            self.checkSession()
        }
    }

    private func checkSession()
    {
        // TODO: comprobar token
        let hasToken = false
        
        if hasToken {
            pushController(LoginController.fromNib())
        } else {
            pushController(IntroController.fromNib())
        }
    }
}
