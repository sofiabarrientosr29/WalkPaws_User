//
//  ExtensionController.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

extension UIViewController {

    static func fromNib() -> Self {
        return Self(nibName: String(describing: Self.self), bundle: nil)
    }

    func pushController(_ controller: UIViewController, animated: Bool = true) {
        if let navigationController {
            navigationController.pushViewController(
                controller,
                animated: animated
            )
        } else {
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(
                name: CAMediaTimingFunctionName.easeInEaseOut
            )
            transition.timingFunction = CAMediaTimingFunction(
                name: .easeInEaseOut
            )
            transition.type = .reveal
            transition.subtype = .fromRight

            view.window?.layer.add(transition, forKey: kCATransition)

            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false)
        }
    }
    
    func popController(_ controller: UIViewController, animated: Bool = true)
    {
        if let navigationController
        {
            navigationController.setViewControllers([controller], animated: animated)
        }
        else
        {
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            transition.type = .reveal
            transition.subtype = .fromLeft

            view.window?.layer.add(transition, forKey: kCATransition)

            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false)
        }
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    func observeKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let keyboardFrame = notification.userInfo?[
                UIResponder.keyboardFrameEndUserInfoKey
            ] as? CGRect
        else { return }

        let keyboardHeight = keyboardFrame.height

        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight / 2.5
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func isValidEmail(_ email: String) -> Bool
    {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }

}
