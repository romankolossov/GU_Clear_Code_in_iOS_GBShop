//
//  UserViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit
import OSLog
import FirebaseAnalytics

// Changing user data and logging out.

class UserViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private lazy var userView: UserView = {
        let view = UserView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var userData: UserData?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userData = UserData.getUser()
        configureUserVCLook()
    }

    // MARK: - Actions

    @objc private func logout() {
        guard let userData = userData else {
            return
        }
        let id = String(userData.user.id)

        let logoutFactory: LogoutRequestFactory = AppDelegate.requestFactory.makeLogoutRequestFactory()

        logoutFactory.logout(id: id) { response in
            switch response.result {
            case .success(let model):
                let resultWithLogoutSuccess: Int = 1

                DispatchQueue.main.async { [weak self] in
                    guard model.result == resultWithLogoutSuccess else {
                        self?.showAlert(
                            title: NSLocalizedString("logout", comment: ""),
                            message: NSLocalizedString("logoutFailure", comment: ""),
                            handler: nil,
                            completion: nil
                        )
                        return
                    }
                    UserData.clearUser()
                    self?.viewDidAppear(true)

                    Analytics.logEvent("logout", parameters: [
                        "name": "logout" as NSObject,
                        "fullText": "logoutWithSuccess" as NSObject
                    ])
                    self?.showAlert(
                        title: NSLocalizedString("logout", comment: ""),
                        message: NSLocalizedString("logoutSuccess", comment: ""),
                        handler: nil,
                        completion: nil
                    )
                }
            case .failure(let error):
                Logger.viewCycle.debug("\(error.localizedDescription)")
            }
        }
    }

    @objc private func changeUserData() {
        // MARK: TO DO
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureUserVCLook() {
        guard let userData = userData,
              !userData.user.login.isEmpty else {
            navigationItem.title =
                "\(NSLocalizedString("userVCName", comment: "Hi")), \(NSLocalizedString("customer", comment: "customer"))"

            userView.idLabel.text = ""
            userView.userNameLabel.text = ""
            userView.passwordLabel.text = ""
            userView.emailLabel.text = ""
            return
        }
        navigationItem.title =
            "\(NSLocalizedString("userVCName", comment: "Hi")), \(userData.user.name)"

        userView.idLabel.text = String(userData.user.id)
        userView.userNameLabel.text = userData.user.name
        userView.passwordLabel.text = userData.user.lastname
        userView.emailLabel.text = userData.user.login
    }

    private func configureUserVC() {
        view.backgroundColor = .rootVCViewBackgroundColor
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureNavigationVC()
        addSubviews()
        setupConstraints()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.tintColor = .navigationControllerNBarTintColor
        navigationController?.navigationBar.backgroundColor = .navigationBarBackgroundColor

        // Create logoutItem and changeUserDataItem in navigation item of navigation bar.
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
    }

    private func addSubviews() {
        view.addSubview(userView)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let userViewConstraints = [
            userView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            userView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            userView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            userView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
    }

}
