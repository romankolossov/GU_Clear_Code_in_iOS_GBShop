//
//  SearchViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchVC()

        // MARK: TO DO: Catalog data
        // MARK: TO DO: Search by id
        // MARK: TO DO: Add to basket
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSearchVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 0.0, blue: 204 / 255, alpha: 1.0)

        self.title = "Search"
        self.tabBarItem.title = ""
        self.view.backgroundColor = .systemPurple
    }

}
