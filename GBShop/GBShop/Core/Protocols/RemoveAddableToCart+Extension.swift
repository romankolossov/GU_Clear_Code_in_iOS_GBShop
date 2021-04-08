//
//  RemoveAddableToCart+Extension.swift
//  GBShop
//
//  Created by Roman Kolosov on 26.03.2021.
//

import UIKit
import OSLog
import FirebaseAnalytics

protocol RemoveAddableToCart: AlertShowable { }

extension RemoveAddableToCart where Self: UIViewController {

    func removeAddToCart(
        idProduct: Int,
        quantity: Int,
        handler: ((UIAlertAction) -> Void)? = nil,
        completion: (() -> Void)? = nil
    ) {
        // Define aguments for alert controller
        let title: String = NSLocalizedString("goodAction", comment: "")
        let message: String = NSLocalizedString("goodActionMessage", comment: "What do You want to do with selcted dood?")

        // Instantiate alert controller
        let alertController = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        // Instantiate alert title
        let alertTitle = NSMutableAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.font: UIFont.alertTitleFont
            ]
        )
        // Configure alert title
        alertTitle.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.alertTitleTextColor,
            range: NSRange(location: 0, length: title.count)
        )
        // Configure alert controller
        alertController.setValue(alertTitle, forKey: "attributedTitle")
        alertController.view.tintColor = .alertViewTintColor

        // Inatatiate add to cart action

        let addToCartAction = UIAlertAction(
            title: NSLocalizedString("addToCart", comment: ""),
            style: .default) { _ in
            let addToBasketRequestFactory: AddToBasketRequestFactory = AppDelegate.requestFactory.makeAddToBasketRequestFactory()

            addToBasketRequestFactory.addToBasket(idProduct: idProduct, quantity: quantity) { response in
                switch response.result {
                case .success(let model):
                    let resultWithAddToBasketSuccess: Int = 1

                    DispatchQueue.main.async { [weak self] in
                        guard model.result == resultWithAddToBasketSuccess else {
                            self?.showAlert(
                                title: NSLocalizedString("cart", comment: ""),
                                message: NSLocalizedString("addToCartFailure", comment: ""),
                                handler: nil,
                                completion: nil
                            )
                            return
                        }
                        Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
                            AnalyticsParameterItemName: "addToCart",
                            AnalyticsParameterSuccess: "goodsWasAddedToCart"
                        ])
                        self?.showAlert(
                            title: NSLocalizedString("cart", comment: ""),
                            message: NSLocalizedString("addToCartSuccess", comment: ""),
                            handler: nil,
                            completion: nil
                        )
                    }
                case .failure(let error):
                    Logger.viewCycle.debug("\(error.localizedDescription)")
                }
            }
        }

        // Inatatiate remove from cart action

        let removeFromCartAction = UIAlertAction(
            title: NSLocalizedString("removeFromCart", comment: ""),
            style: .default) { _ in
            let deleteFromBasketRequestFactory: DeleteFromBasketRequestFactory = AppDelegate.requestFactory.makeDeleteFromBasketRequestFactory()

            deleteFromBasketRequestFactory.deleteFromBasket(idProduct: idProduct) { response in
                switch response.result {
                case .success(let model):
                    let resultWithDeleteFromBasketSuccess: Int = 1

                    DispatchQueue.main.async { [weak self] in
                        guard model.result == resultWithDeleteFromBasketSuccess else {
                            self?.showAlert(
                                title: NSLocalizedString("cart", comment: ""),
                                message: NSLocalizedString("removeFromCartFailure", comment: ""),
                                handler: nil,
                                completion: nil
                            )
                            return
                        }
                        Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
                            AnalyticsParameterItemName: "removeFromCart",
                            AnalyticsParameterSuccess: "goodsWasRemovedFromCart"
                        ])
                        self?.showAlert(
                            title: NSLocalizedString("cart", comment: ""),
                            message: NSLocalizedString("removeFromCartSuccess", comment: ""),
                            handler: nil,
                            completion: nil
                        )
                    }
                case .failure(let error):
                    Logger.viewCycle.debug("\(error.localizedDescription)")
                }
            }
        }

        // Instatiate cancel action

        let cancelAction = UIAlertAction(
            title: NSLocalizedString("cancel", comment: ""),
            style: .destructive,
            handler: nil
        )
        alertController.addAction(addToCartAction)
        alertController.addAction(removeFromCartAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: completion)
    }
}
