//
//  CartViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// for Delete from basket and Pay basket

class CartViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait
        configureCartVC()
    }

    // MARK: - Actions

    @objc private func payBasket() {
        // MARK: TO DO
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureCartVC() {
        navigationItem.title = NSLocalizedString("cartVCName", comment: "Cart")
        view.backgroundColor = UIColor.rootVCViewBackgroundColor
        configureNavigationVC()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.tintColor = .white

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        // Create payBasketItem in Navigation Item of Navigation Bar

        let payBasketItem = UIBarButtonItem(
            image: UIImage(systemName: "creditcard"),
            style: .plain,
            target: self,
            action: #selector(payBasket)
        )
        navigationItem.rightBarButtonItems = [payBasketItem]
    }

}
