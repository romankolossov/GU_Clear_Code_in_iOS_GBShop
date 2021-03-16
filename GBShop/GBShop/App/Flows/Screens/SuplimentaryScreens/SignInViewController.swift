//
//  SignInViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 14.03.2021.
//

import UIKit

class SignInViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private let signInView: SignInView = {
        let view = SignInView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("toSignIn", comment: "Sign in"), for: .normal)
        button.setTitleColor(UIColor.buttonTitleColor, for: .normal)
        button.setTitleColor(UIColor.buttonTitleColorWhenHighlighted, for: .highlighted)
        button.backgroundColor = UIColor.buttonBackgroundColor
        button.layer.borderWidth = 1.7
        button.layer.borderColor = UIColor.buttonBorderColor.cgColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var navigationBar = UINavigationBar()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()

        // MARK: Targets

        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func signIn() {
        let signUpFactory: AuthRequestFactory = AppDelegate.requestFactory.makeAuthRequestFatory()

        signUpFactory.signIn(
            userName: signInView.userNameTextField.text ?? "",
            password: signInView.passwordTextField.text ?? ""
        ) { response in

            switch response.result {
            case .success(let model):
                let resultWithSignInSuccess: Int = 1
                #if DEBUG
                print(model)
                #endif
                DispatchQueue.main.async { [weak self] in
                    let handler: ((UIAlertAction) -> Void)? = { [weak self] _ in self?.dismiss(animated: true, completion: nil)
                    }
                    guard model.result == resultWithSignInSuccess else {
                        self?.showAlert(
                            title: NSLocalizedString("signin", comment: "Signin"),
                            message: NSLocalizedString("signinFailure", comment: ""),
                            handler: handler,
                            completion: nil
                        )
                        return
                    }
                    UserData.saveUser(
                        id: model.user.id,
                        login: model.user.login,
                        name: model.user.name,
                        lastName: model.user.lastname
                    )
                    self?.showAlert(
                        title: NSLocalizedString("signin", comment: "Signin"),
                        message: NSLocalizedString("signinSuccess", comment: ""),
                        handler: handler,
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

    // MARK: - Private methods

    // MARK: Configure

    private func configureSubviews() {
        let navigationBarHeight: CGFloat = 56.0
        let signInButtonHeight: CGFloat = 56.0

        // Create Navigation Bar with Navigation Item to set the title of the SignUp VC

        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.view.bounds.size.width,
            height: navigationBarHeight
        )
        let navigationItem = UINavigationItem()

        navigationItem.title = NSLocalizedString("signin", comment: "Signin")

        navigationBar = UINavigationBar(frame: frame)
        navigationBar.items = [navigationItem]

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor
        ]
        navigationBar.barTintColor = UIColor.navigationBarTintColor

        // for corners of the signUpButton will be rounded

        signInButton.frame.size.height = signInButtonHeight
        signInButton.layer.cornerRadius = signInButton.frame.size.height / 4.8

        // Add subviews

        view.addSubview(signInView)
        view.addSubview(signInButton)
        view.addSubview(navigationBar)

        // Set constraints

        let safeArea = view.safeAreaLayoutGuide
        let signInViewConstraints = [
            signInView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: navigationBarHeight),
            signInView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signInView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signInView.bottomAnchor.constraint(equalTo: signInButton.topAnchor)
        ]
        let signInButtonConstraints = [
            signInButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: signInButtonHeight),
            signInButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(signInViewConstraints)
        NSLayoutConstraint.activate(signInButtonConstraints)
    }

}
