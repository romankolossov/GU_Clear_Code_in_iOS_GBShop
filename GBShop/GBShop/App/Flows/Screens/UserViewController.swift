//
//  UserViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUserVC()

        // MARK: TO DO: Change user data
        // MARK: TO DO: Logout
    }

    // MARK: - Actions

    @objc private func logout() {
        // MARK: TO DO

    }
    @objc private func changeUserData() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureUserVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 0.0, blue: 204 / 255, alpha: 1.0)

        let logoutItem = UIBarButtonItem(image: UIImage(systemName: "arrow.right.square"), style: .done, target: self, action: #selector(logout))
        let changeUserDataItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(changeUserData))

        navigationItem.rightBarButtonItems = [logoutItem, changeUserDataItem]

        // MARK: TO DO: "Hi, UserName!"
        self.title = "Hi, User!"
        self.tabBarItem.title = ""
        self.view.backgroundColor = .systemPurple
    }

}
