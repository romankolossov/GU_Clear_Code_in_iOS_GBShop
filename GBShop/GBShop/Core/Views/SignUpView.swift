//
//  SignUpView.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

class SignUpView: UIView {

    // MARK: - Public properties

    // MARK: Subviews

    let titleLabel = UILabel()

    let idTextField = UITextField()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let emailTextField = UITextField()
    let genderTextField = UITextField()
    let creditCardTextField = UITextField()
    let bioTextField = UITextField()

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
        self.backgroundColor = UIColor.signUpViewBackgroundColor

        self.addSubviews()
        self.setupConstraints()
    }

    private func addSubviews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Sign up"
        titleLabel.textColor = UIColor.titleLableTextColor
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.titleLabelFont

        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.text = "123"
        idTextField.textColor = UIColor.userDataTextFieldTextColor
        idTextField.textAlignment = .left
        idTextField.font = UIFont.userDataTextFieldFont

        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.text = "Somebody"
        userNameTextField.textColor = UIColor.userDataTextFieldTextColor
        userNameTextField.textAlignment = .left
        userNameTextField.font = UIFont.userDataTextFieldFont

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.text = "mypassword"
        passwordTextField.textColor = UIColor.userDataTextFieldTextColor
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont.userDataTextFieldFont

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.text = "some@some.ru"
        emailTextField.textColor = UIColor.userDataTextFieldTextColor
        emailTextField.textAlignment = .left
        emailTextField.font = UIFont.userDataTextFieldFont

        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        genderTextField.text = "m"
        genderTextField.textColor = UIColor.userDataTextFieldTextColor
        genderTextField.textAlignment = .left
        genderTextField.font = UIFont.userDataTextFieldFont

        creditCardTextField.translatesAutoresizingMaskIntoConstraints = false
        creditCardTextField.text = "9872389-2424-234224-234"
        creditCardTextField.textColor = UIColor.userDataTextFieldTextColor
        creditCardTextField.textAlignment = .left
        creditCardTextField.font = UIFont.userDataTextFieldFont

        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.text = "This is good! I think I will switch to another language"
        bioTextField.textColor = UIColor.userDataTextFieldTextColor
        bioTextField.textAlignment = .left
        bioTextField.font = UIFont.userDataTextFieldFont

        self.addSubview(titleLabel)
        self.addSubview(idTextField)
        self.addSubview(userNameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(emailTextField)
        self.addSubview(genderTextField)
        self.addSubview(creditCardTextField)
        self.addSubview(bioTextField)
    }

    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        let indent: CGFloat = 21.0

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: indent),
            titleLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            titleLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: indent * 2),
            idTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            idTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            userNameTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: indent),
            userNameTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            userNameTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: indent),
            passwordTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            passwordTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            emailTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: indent),
            emailTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            emailTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            genderTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: indent),
            genderTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            genderTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            creditCardTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: indent),
            creditCardTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            creditCardTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            bioTextField.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor, constant: indent),
            bioTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            bioTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent)
        ])
    }

}
