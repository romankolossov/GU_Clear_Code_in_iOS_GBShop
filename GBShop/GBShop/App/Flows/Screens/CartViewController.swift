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
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 26 / 255, blue: 136 / 255, alpha: 1.0)

        let payBasketItem = UIBarButtonItem(image: UIImage(systemName: "creditcard"), style: .plain, target: self, action: #selector(payBasket))

        navigationItem.rightBarButtonItems = [payBasketItem]

        self.title = NSLocalizedString("cartVCName", comment: "Cart")
        self.tabBarItem.title = nil
        self.view.backgroundColor = .systemPurple
    }

}
