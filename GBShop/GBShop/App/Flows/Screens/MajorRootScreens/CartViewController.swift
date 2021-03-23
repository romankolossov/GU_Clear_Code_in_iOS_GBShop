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

        self.configureCartVC()
    }

    // MARK: - Actions

    @objc private func payBasket() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureCartVC() {
        navigationItem.title = NSLocalizedString("cartVCName", comment: "Cart")

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        let payBasketItem = UIBarButtonItem(
            image: UIImage(systemName: "creditcard"),
            style: .plain,
            target: self,
            action: #selector(payBasket)
        )
        navigationItem.rightBarButtonItems = [payBasketItem]

        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor
        self.tabBarItem.title = nil
    }

}
