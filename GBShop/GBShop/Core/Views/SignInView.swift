//
//  SignInView.swift
//  GBShop
//
//  Created by Roman Kolosov on 14.03.2021.
//

import UIKit

class SignInView: UIScrollView {

    // MARK: - Public properties

    // MARK: Subviews

    let userNameTextField = UITextField()
    let passwordTextField = UITextField()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func configureUI() {
        accessibilityIdentifier = "signInView"
        backgroundColor = .suplimentaryViewBackgroundColor
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = " User name"
        userNameTextField.accessibilityIdentifier = "userNameTextField"
        userNameTextField.textColor = .userTextFieldTextColor
        userNameTextField.textAlignment = .left
        userNameTextField.font = .userTextFieldFont
        userNameTextField.backgroundColor = .userTextFieldTextBackgroundColor
        userNameTextField.layer.cornerRadius = .textFieldCornerRadius

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = " Password"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        passwordTextField.textColor = .userTextFieldTextColor
        passwordTextField.textAlignment = .left
        passwordTextField.font = .userTextFieldFont
        passwordTextField.backgroundColor = .userTextFieldTextBackgroundColor
        passwordTextField.layer.cornerRadius = .textFieldCornerRadius

        addSubview(userNameTextField)
        addSubview(passwordTextField)
    }

    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        let indent: CGFloat = 21.0

        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: indent),
            userNameTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            userNameTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: indent),
            passwordTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            passwordTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent)
        ])
    }

}
