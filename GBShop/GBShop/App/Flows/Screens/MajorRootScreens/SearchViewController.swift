//
//  SearchViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// Displaying catalog data, searching good by id and adding good to basket.

class SearchViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchVC()
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSearchVC() {
        navigationItem.title = NSLocalizedString("searchVCName", comment: "Search")
        view.backgroundColor = .rootVCViewBackgroundColor
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureNavigationVC()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.tintColor = .navigationControllerNBarTintColor

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .navigationBarBackgroundColor
    }

}
