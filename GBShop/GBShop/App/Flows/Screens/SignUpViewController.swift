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
        button.setTitleColor(UIColor.tabBarTintColor, for: .normal)
        button.setTitleColor(UIColor.buttonTitleColorWhenHighlighted, for: .highlighted)
        button.backgroundColor = UIColor.tabBarBackgroundColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
        view.addSubview(signUpView)
        view.addSubview(signUpButton)

        let safeArea = view.safeAreaLayoutGuide
        let signUpButtonHeight: CGFloat = 56.0

        let userViewConstraints = [
            signUpView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor)
        ]
        let signUpButtonConstraints = [
            signUpButton.topAnchor.constraint(equalTo: signUpView.bottomAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: signUpButtonHeight),
            signUpButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
        NSLayoutConstraint.activate(signUpButtonConstraints)
    }

}
