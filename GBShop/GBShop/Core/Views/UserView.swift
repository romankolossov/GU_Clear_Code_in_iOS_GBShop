//
//  UserView.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

class UserView: UIView {

    // MARK: - Public properties

    // MARK: Subviews

    let idLabel = UILabel()
    let userNameLabel = UILabel()
    let passwordLabel = UILabel()
    let emailLabel = UILabel()
    let genderLabel = UILabel()
    let creditCardLabel = UILabel()
    let bioLabel = UILabel()

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
        self.backgroundColor = UIColor.userViewBackgroundColor

        self.addSubviews()
        self.setupConstraints()
    }

    private func addSubviews() {
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.text = "idLabel test text"
        idLabel.textColor = UIColor.userDataLableTextColor
        idLabel.textAlignment = .left
        idLabel.font = UIFont.userDataLableFont

        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "userNameLabel test text"
        userNameLabel.textColor = UIColor.userDataLableTextColor
        userNameLabel.textAlignment = .left
        userNameLabel.font = UIFont.userDataLableFont

        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "passwordLabel test text"
        passwordLabel.textColor = UIColor.userDataLableTextColor
        passwordLabel.textAlignment = .left
        passwordLabel.font = UIFont.userDataLableFont

        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "emailLabel test text"
        emailLabel.textColor = UIColor.userDataLableTextColor
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.userDataLableFont

        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "genderLabel test text"
        genderLabel.textColor = UIColor.userDataLableTextColor
        genderLabel.textAlignment = .left
        genderLabel.font = UIFont.userDataLableFont

        creditCardLabel.translatesAutoresizingMaskIntoConstraints = false
        creditCardLabel.text = "creditCardLabel test text"
        creditCardLabel.textColor = UIColor.userDataLableTextColor
        creditCardLabel.textAlignment = .left
        creditCardLabel.font = UIFont.userDataLableFont

        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.text = "bioLabel test text"
        bioLabel.textColor = UIColor.userDataLableTextColor
        bioLabel.textAlignment = .left
        bioLabel.font = UIFont.userDataLableFont
        bioLabel.numberOfLines = 3

        self.addSubview(idLabel)
        self.addSubview(userNameLabel)
        self.addSubview(passwordLabel)
        self.addSubview(emailLabel)
        self.addSubview(genderLabel)
        self.addSubview(creditCardLabel)
        self.addSubview(bioLabel)
    }

    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        let indent: CGFloat = 21.0

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: indent),
            idLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            idLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            userNameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: indent),
            userNameLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            userNameLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            passwordLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: indent),
            passwordLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            passwordLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            emailLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: indent),
            emailLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            emailLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            genderLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: indent),
            genderLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            genderLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            creditCardLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: indent),
            creditCardLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            creditCardLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent),

            bioLabel.topAnchor.constraint(equalTo: creditCardLabel.bottomAnchor, constant: indent),
            bioLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            bioLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: indent)
        ])
    }

}
