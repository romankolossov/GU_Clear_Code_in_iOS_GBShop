//
//  CartViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

class CartViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCartVC()

        // MARK: TO DO: Delete from basket
        // MARK: TO DO: Pay basket
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureCartVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 0.0, blue: 204 / 255, alpha: 1.0)

        self.title = "Cart"
        self.tabBarItem.title = ""
        self.view.backgroundColor = .systemPurple
    }

}
