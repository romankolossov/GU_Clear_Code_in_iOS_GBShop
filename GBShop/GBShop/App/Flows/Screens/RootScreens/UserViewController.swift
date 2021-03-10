//
//  UserViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// for Change user data and Logout

class UserViewController: UIViewController {

    // MARK: - Private properties

    private let userView: UserView = {
        let view = UserView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        self.configureUserVC()
        self.configureSubviews()
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
        // MARK: TO DO: "Hi, UserName!"
        self.navigationItem.title = "\(NSLocalizedString("userVCName", comment: "Hi")), User"

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]

        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        let logoutItem = UIBarButtonItem(
            image: UIImage(systemName: "arrowshape.zigzag.right"),
            style: .done,
            target: self,
            action: #selector(logout)
        )
        let changeUserDataItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(changeUserData)
        )
        navigationItem.rightBarButtonItems = [logoutItem, changeUserDataItem]

        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor
        self.tabBarItem.title = nil
    }

    private func configureSubviews() {
        view.addSubview(userView)

        let safeArea = view.safeAreaLayoutGuide
        let userViewConstraints = [
            userView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            userView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userView.widthAnchor.constraint(equalTo: view.widthAnchor),
            userView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
    }

}
