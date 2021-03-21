//
//  SignUpViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

class SignUpViewController: UIViewController, AlertShowable {

    // MARK: - Private properties

    private lazy var signUpView: SignUpView = {
        let view = SignUpView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var signUpButton: ShakableButton = {
        let button = ShakableButton()
        button.setTitle(NSLocalizedString("toSignUp", comment: "Sign up"), for: .normal)
        button.setTitleColor(.buttonTitleColor, for: .normal)
        button.setTitleColor(.buttonTitleColorWhenHighlighted, for: .highlighted)
        button.backgroundColor = .buttonBackgroundColor
        button.frame.size.height = .buttonHeight
        button.layer.borderWidth = .buttonBorderWidth
        button.layer.borderColor = UIColor.buttonBorderColor.cgColor
        button.layer.cornerRadius = .buttonCornerRadius
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var navigationBar: UINavigationBar = {
        // Create Navigation Bar with Navigation Item to set the title of the SignUp VC

        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: view.bounds.size.width,
            height: .navigationBarHeight
        )
        let navigationItem = UINavigationItem()
        navigationItem.title = NSLocalizedString("signup", comment: "")

        let navigationBar = UINavigationBar(frame: frame)
        navigationBar.items = [navigationItem]

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor
        ]
        navigationBar.barTintColor = .navigationBarTintColor
        return navigationBar
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSignUpVC()

        // MARK: Targets

        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
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
        signUpView.addGestureRecognizer(tapGesture)
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

    // MARK: Signup

    @objc private func signUp() {
        signUpButton.shake() // Animate button

        let signUpFactory: SignUpRequestFactory = AppDelegate.requestFactory.makeSignUpRequestFactory()

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
                            title: NSLocalizedString("signup", comment: ""),
                            message: NSLocalizedString("signupFailure", comment: ""),
                            handler: handler,
                            completion: nil
                        )
                        return
                    }
                    self?.showAlert(
                        title: NSLocalizedString("signup", comment: ""),
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
        signUpView.contentInset = contentInsets
        signUpView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHiden(notification: Notification) {
        signUpView.contentInset = UIEdgeInsets.zero
        signUpView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    @objc func hideKeyboard() {
        signUpView.endEditing(true)
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureSignUpVC() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(signUpView)
        view.addSubview(signUpButton)
        view.addSubview(navigationBar)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let signUpViewConstraints = [
            signUpView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: .navigationBarHeight),
            signUpView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signUpView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signUpView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor)
        ]
        let signUpButtonConstraints = [
            signUpButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: .buttonHeight),
            signUpButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(signUpViewConstraints)
        NSLayoutConstraint.activate(signUpButtonConstraints)
    }

}
