//
//  UserViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

// for Change user data and Logout

class UserViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private let userView: UserView = {
        let view = UserView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var userData: UserData?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        self.configureUserVC()
        self.configureSubviews()
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
                #if DEBUG
                print(model)
                #endif

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

                    self?.showAlert(
                        title: NSLocalizedString("logout", comment: ""),
                        message: NSLocalizedString("logoutSuccess", comment: ""),
                        handler: nil,
                        completion: nil
                    )
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async { [weak self] in
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    @objc private func changeUserData() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureUserVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor

        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        // Create logoutItem and changeUserDataItem in Navigation Item of Navigation Bar

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

    private func configureUserVCLook() {
        guard let userData = userData else {
            return
        }
        self.navigationItem.title = "\(NSLocalizedString("userVCName", comment: "Hi")), \(userData.user.name)"

        userView.idLabel.text = String(userData.user.id)
        userView.userNameLabel.text = userData.user.name
        userView.passwordLabel.text = userData.user.lastname
        userView.emailLabel.text = userData.user.login
    }

    private func configureSubviews() {
        // Add subviews
        view.addSubview(userView)

        // Set constraints

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
