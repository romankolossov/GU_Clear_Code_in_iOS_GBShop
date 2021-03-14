//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

class SignUpViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private let signUpView: SignUpView = {
        let view = SignUpView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("toSignUp", comment: "Sign up"), for: .normal)
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
    private let requestFactory = RequestFactory()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()

        // MARK: Targets

        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func signUp() {
        let signUpFactory: SignUpRequestFactory = requestFactory.makeSignUpRequestFactory()

        signUpFactory.signUp(
            id: signUpView.idTextField.text ?? "",
            userName: signUpView.userNameTextField.text ?? "",
            password: signUpView.passwordTextField.text ?? "",
            email: signUpView.emailTextField.text ?? "",
            gender: signUpView.genderTextField.text ?? "",
            creditCard: signUpView.creditCardTextField.text ?? "",
            bio: signUpView.bioTextField.text ?? ""
        ) { response in

            switch response.result {
            case .success(let model):
                let resultWithSignUpSuccess: Int = 1
                #if DEBUG
                print(model)
                #endif
                DispatchQueue.main.async { [weak self] in
                    let handler: ((UIAlertAction) -> Void)? = { [weak self] _ in self?.dismiss(animated: true, completion: nil)
                    }
                    guard model.result == resultWithSignUpSuccess else {
                        self?.showAlert(
                            title: NSLocalizedString("signup", comment: "Signup"),
                            message: NSLocalizedString("signupFailure", comment: ""),
                            handler: handler,
                            completion: nil
                        )
                        return
                    }
                    self?.showAlert(
                        title: NSLocalizedString("signup", comment: "Signup"),
                        message: NSLocalizedString("signupSuccess", comment: ""),
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
        let signUpButtonHeight: CGFloat = 56.0

        // Create Navigation Bar with Navigation Item to set the title of the SignUp VC

        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.view.bounds.size.width,
            height: navigationBarHeight
        )
        let navigationItem = UINavigationItem()

        navigationItem.title = NSLocalizedString("signup", comment: "Signup")

        navigationBar = UINavigationBar(frame: frame)
        navigationBar.items = [navigationItem]

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor
        ]
        navigationBar.barTintColor = UIColor.navigationBarTintColor

        // for corners of the signUpButton will be rounded

        signUpButton.frame.size.height = signUpButtonHeight
        signUpButton.layer.cornerRadius = signUpButton.frame.size.height / 4.8

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
            signUpButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: signUpButtonHeight),
            signUpButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(userViewConstraints)
        NSLayoutConstraint.activate(signUpButtonConstraints)
    }

}
