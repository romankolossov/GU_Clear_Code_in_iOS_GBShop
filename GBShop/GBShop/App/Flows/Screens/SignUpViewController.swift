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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        self.configureSubviews()
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSubviews() {
        view.addSubview(signUpView)

        let safeArea = view.safeAreaLayoutGuide
        let userViewConstraints = [
            signUpView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
    }

}
