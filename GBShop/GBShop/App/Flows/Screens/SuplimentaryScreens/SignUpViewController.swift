//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Private properties

    private let signUpView: SignUpView = {
        let view = SignUpView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("signUp", comment: "Sign up"), for: .normal)
        button.setTitleColor(UIColor.buttonTitleColor, for: .normal)
        button.setTitleColor(UIColor.buttonTitleColorWhenHighlighted, for: .highlighted)
        button.backgroundColor = UIColor.tabBarBackgroundColor
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

        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func signUp() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSubviews() {
        let navigationBarHeight: CGFloat = 53.0
        let signUpButtonHeight: CGFloat = 53.0

        // Create Navigation Bar with Navigation Item to set the title of the SignUp VC

        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.view.bounds.size.width,
            height: navigationBarHeight
        )
        let navigationItem = UINavigationItem()

        navigationItem.title = NSLocalizedString("signUp", comment: "Sign up")

        navigationBar = UINavigationBar(frame: frame)
        navigationBar.items = [navigationItem]

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor
        ]
        navigationBar.barTintColor = UIColor.navigationBarTintColor

        // Add subviews

        view.addSubview(signUpView)
        view.addSubview(signUpButton)
        view.addSubview(navigationBar)

        // Set constraints
        let safeArea = view.safeAreaLayoutGuide
        let userViewConstraints = [
            signUpView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: navigationBarHeight),
            signUpView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signUpView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signUpView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor)
        ]
        let signUpButtonConstraints = [
            signUpButton.topAnchor.constraint(equalTo: signUpView.bottomAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: signUpButtonHeight),
            signUpButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
        NSLayoutConstraint.activate(signUpButtonConstraints)
    }

}
