//
//  UserViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// for Change user data and Logout

class UserViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        self.configureUserVC()
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
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 26 / 255, blue: 136 / 255, alpha: 1.0)

        let logoutItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.zigzag.right"), style: .done, target: self, action: #selector(logout))
        let changeUserDataItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(changeUserData))

        navigationItem.rightBarButtonItems = [logoutItem, changeUserDataItem]

        // MARK: TO DO: "Hi, UserName!"
        self.title = "\(NSLocalizedString("userVCName", comment: "Hi")), User"
        self.tabBarItem.title = nil
        self.view.backgroundColor = .systemPurple
    }

}
