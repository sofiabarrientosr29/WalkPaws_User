//
//  BackButton.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class BackButton: UIButton
{

    override func awakeFromNib()
    {
        super.awakeFromNib()

        addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }

    @objc private func goBack()
    {
        guard let controller = findViewController() else { return }

        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .reveal
        transition.subtype = .fromLeft

        controller.view.window?.layer.add(transition, forKey: kCATransition)
        controller.dismiss(animated: false)
    }
}
