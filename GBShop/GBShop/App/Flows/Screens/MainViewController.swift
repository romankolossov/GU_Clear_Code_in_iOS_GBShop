//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainVC()

        // MARK: TO DO: Auth
        // MARK: TO DO: Sign Up
    }

    // MARK: - Actions

    @objc private func signUp() {
        // MARK: TO DO

    }
    @objc private func login() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureMainVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 0.0, blue: 204 / 255, alpha: 1.0)

        let registerNewUserItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.plus"), style: .plain, target: self, action: #selector(signUp))
        let loginItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.checkmark"), style: .done, target: self, action: #selector(login))

        navigationItem.rightBarButtonItems = [registerNewUserItem, loginItem]

        self.title = "GB Shop"
        self.tabBarItem.title = ""
        self.view.backgroundColor = .systemPurple
    }

}
