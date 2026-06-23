//
//  ExtensionView.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

extension UIView {

    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self

        while let currentResponder = responder {
            if let viewController = currentResponder as? UIViewController {
                return viewController
            }

            responder = currentResponder.next
        }

        return nil
    }
}
