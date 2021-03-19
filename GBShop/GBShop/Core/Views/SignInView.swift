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
        self.configureUI()
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func configureUI() {
        self.backgroundColor = UIColor.suplimentaryViewBackgroundColor
        self.addSubviews()
        self.setupConstraints()
    }

    private func addSubviews() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.text = "Somebody"
        userNameTextField.textColor = UIColor.userTextFieldTextColor
        userNameTextField.textAlignment = .left
        userNameTextField.font = UIFont.userTextFieldFont

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.text = "mypassword"
        passwordTextField.textColor = UIColor.userTextFieldTextColor
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont.userTextFieldFont

        self.addSubview(userNameTextField)
        self.addSubview(passwordTextField)
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
