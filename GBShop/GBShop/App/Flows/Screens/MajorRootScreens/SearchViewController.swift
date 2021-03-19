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
        configureSearchVC()
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSearchVC() {
        navigationItem.title = NSLocalizedString("searchVCName", comment: "Search")
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
    }

}
