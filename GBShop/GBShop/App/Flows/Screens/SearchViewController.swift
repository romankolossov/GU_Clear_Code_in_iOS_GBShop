//
//  SearchViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: TO DO: Catalog data
    // MARK: TO DO: Search good by id
    // MARK: TO DO: Add to basket

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        self.configureSearchVC()
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSearchVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 26 / 255, blue: 136 / 255, alpha: 1.0)

        self.title = "Search"
        self.tabBarItem.title = nil
        self.view.backgroundColor = .systemPurple
    }

}
