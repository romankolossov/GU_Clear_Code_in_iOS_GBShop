//
//  AlertShowable.swift
//  GBShop
//
//  Created by Roman Kolosov on 12.03.2021.
//

import UIKit

protocol AlertShowable { }

extension AlertShowable where Self: UIViewController {

    func showAlert(
        title: String? = nil,
        message: String? = nil,
        handler: ((UIAlertAction) -> Void)? = nil,
        completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        alertController.view.tintColor = UIColor.alertViewTintColor

        let alertTitle = NSMutableAttributedString(
            string: title ?? "",
            attributes: [
                NSAttributedString.Key.font: UIFont.alertTitleFont
            ]
        )
        alertTitle.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.alertTitleTextColor,
            range: NSRange(location: 0, length: title?.count ?? 0)
        )
        alertController.setValue(alertTitle, forKey: "attributedTitle")

        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: handler
        )
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: completion)
    }
}
