//
//  SignInViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 14.03.2021.
//

import UIKit

class SignInViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private lazy var signInView: SignInView = {
        let view = SignInView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("toSignIn", comment: "Sign in"), for: .normal)
        button.setTitleColor(UIColor.buttonTitleColor, for: .normal)
        button.setTitleColor(UIColor.buttonTitleColorWhenHighlighted, for: .highlighted)
        button.backgroundColor = UIColor.buttonBackgroundColor
        button.layer.borderWidth = CGFloat.buttonBorderWidth
        button.layer.borderColor = UIColor.buttonBorderColor.cgColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var navigationBar = UINavigationBar()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSignInVC()

        // MARK: Targets

        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHiden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard)
        )
        signInView.addGestureRecognizer(tapGesture)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Actions

    // MARK: Signin

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
                            title: NSLocalizedString("signin", comment: ""),
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
                        title: NSLocalizedString("signin", comment: ""),
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

    // MARK: Keyboard

    @objc func keyboardWillBeShown(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let info = userInfo as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size

        let contentInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: keyboardSize?.height ?? 0.0,
            right: 0.0
        )
        signInView.contentInset = contentInsets
        signInView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHiden(notification: Notification) {
        signInView.contentInset = UIEdgeInsets.zero
        signInView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    @objc func hideKeyboard() {
        signInView.endEditing(true)
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSignInVC() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        // Create Navigation Bar with Navigation Item to set the title of the SignUp VC

        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: view.bounds.size.width,
            height: .navigationBarHeight
        )
        let navigationItem = UINavigationItem()
        navigationItem.title = NSLocalizedString("signin", comment: "")

        navigationBar = UINavigationBar(frame: frame)
        navigationBar.items = [navigationItem]

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor
        ]
        navigationBar.barTintColor = .navigationBarTintColor

        // for corners of the signUpButton to be rounded

        signInButton.frame.size.height = .buttonHeight
        signInButton.layer.cornerRadius = .buttonCornerRadius

        // Add subviews

        view.addSubview(signInView)
        view.addSubview(signInButton)
        view.addSubview(navigationBar)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let signInViewConstraints = [
            signInView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: .navigationBarHeight),
            signInView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signInView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signInView.bottomAnchor.constraint(equalTo: signInButton.topAnchor)
        ]
        let signInButtonConstraints = [
            signInButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: .buttonHeight),
            signInButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(signInViewConstraints)
        NSLayoutConstraint.activate(signInButtonConstraints)
    }

}
