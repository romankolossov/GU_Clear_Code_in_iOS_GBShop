//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

// for Sign in and Sign up

class MainViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureMainVC()
    }

    // MARK: - Actions

    @objc private func signUp() {
        // MARK: TO DO

    }
    @objc private func signIn() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureMainVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 26 / 255, blue: 136 / 255, alpha: 1.0)

        let registerNewUserItem = UIBarButtonItem(image: UIImage(systemName: "person.fill.badge.plus"), style: .plain, target: self, action: #selector(signUp))
        let loginItem = UIBarButtonItem(image: UIImage(systemName: "checkmark.seal"), style: .done, target: self, action: #selector(signIn))

        navigationItem.rightBarButtonItems = [registerNewUserItem, loginItem]

        self.title = NSLocalizedString("mainVCName", comment: "GB Shop")
        self.tabBarItem.title = nil
        self.view.backgroundColor = .systemPurple
    }

}