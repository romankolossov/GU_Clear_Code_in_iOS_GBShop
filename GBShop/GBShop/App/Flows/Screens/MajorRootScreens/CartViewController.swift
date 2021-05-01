//
//  CartViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit
import OSLog
import FirebaseAnalytics

// Deleting from basket and paying basket.

class CartViewController: UIViewController, AlertShowable {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCartVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // TO DO loadData()
    }

    // MARK: - Actions

    @objc private func payBasket() {
        let payBasketRequestFactory: PayBasketRequestFactory = AppDelegate.requestFactory.makePayBasketRequestFactory()

        payBasketRequestFactory.payBasket(idPayProve: 1) { response in
            switch response.result {
            case .success(let model):
                let resultWithPaySuccess: Int = 1

                DispatchQueue.main.async { [weak self] in
                    guard model.result == resultWithPaySuccess else {
                        self?.showAlert(
                            title: NSLocalizedString("payBasket", comment: ""),
                            message: NSLocalizedString("payBasketFailure", comment: ""),
                            handler: nil,
                            completion: nil
                        )
                        return
                    }
                    // TO DO BasketData.clearBasket()
                    // TO DO self?.viewDidAppear(true)

                    Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: [
                        AnalyticsParameterItemName: "basketPaid",
                        AnalyticsParameterSuccess: "basketWasPaid"
                    ])
                    self?.showAlert(
                        title: NSLocalizedString("payBasket", comment: ""),
                        message: NSLocalizedString("payBasketSuccess", comment: ""),
                        handler: nil,
                        completion: nil
                    )
                }
            case .failure(let error):
                Logger.viewCycle.debug("\(error.localizedDescription)")
            }
        }
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureCartVC() {
        navigationItem.title = NSLocalizedString("cartVCName", comment: "Cart")
        view.backgroundColor = .rootVCViewBackgroundColor
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureNavigationVC()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.tintColor = .navigationControllerNBarTintColor
        navigationController?.navigationBar.backgroundColor = .navigationBarBackgroundColor

        // Create payBasketItem in navigation item of navigation bar.
        let payBasketItem = UIBarButtonItem(
            image: UIImage(systemName: "creditcard"),
            style: .plain,
            target: self,
            action: #selector(payBasket)
        )
        navigationItem.rightBarButtonItems = [payBasketItem]
    }

}
