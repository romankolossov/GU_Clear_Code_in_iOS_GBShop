//
//  SearchViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// for display Catalog data, Search good by id and Add good to basket

class SearchViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait
        self.configureSearchVC()
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSearchVC() {
        navigationItem.title = NSLocalizedString("searchVCName", comment: "Search")
        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor
    }

}
