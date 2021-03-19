//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

// for Sign in and Sign up

class MainViewController: UIViewController {

    // MARK: - Public properties

    var publicGoodsCellIdentifier: String {
        goodsCellIdentifier
    }
    var goods: [GoodData] = []
    // var isLoading: Bool = false

    // MARK: - Private properties

    private let goodsCellIdentifier: String = "GoodsCellIdentifier"
    private var collectionView: UICollectionView?
    private var refreshControl = UIRefreshControl()
    private var navigationBar = UINavigationBar()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureMainVC()
        configureCollectionView()

        addSubviews()
        setupRefreshControl()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    // MARK: - Actions

    @objc private func signUp() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .formSheet

        self.navigationController?.present(
            signUpViewController,
            animated: true,
            completion: nil
        )
    }

    @objc private func signIn() {
        let signInViewController = SignInViewController()
        signInViewController.modalPresentationStyle = .formSheet

        self.navigationController?.present(
            signInViewController,
            animated: true,
            completion: nil
        )
    }

    @objc private func refresh(_ sender: UIRefreshControl) {
        self.loadData { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureMainVC() {
        navigationItem.title = NSLocalizedString("mainVCName", comment: "GB Shop")
        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        // Create registerNewUserItem and signInItem in Navigation Item of Navigation Bar

        let registerNewUserItem = UIBarButtonItem(
            image: UIImage(systemName: "person.fill.badge.plus"),
            style: .plain,
            target: self,
            action: #selector(signUp)
        )
        let signInItem = UIBarButtonItem(
            image: UIImage(systemName: "checkmark.seal"),
            style: .done,
            target: self,
            action: #selector(signIn)
        )
        navigationItem.rightBarButtonItems = [registerNewUserItem, signInItem]
    }

    private func configureCollectionView() {
        // Custom layout

        let layout = GoodsLayout()
        let safeArea = view.safeAreaLayoutGuide

        collectionView = UICollectionView(
            frame: safeArea.layoutFrame,
            collectionViewLayout: layout
        )
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = UIColor.goodsCollectionViewBackgroundColor

        collectionView?.dataSource = self
        collectionView?.delegate = self

        collectionView?.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: publicGoodsCellIdentifier)
    }

    private func addSubviews() {
        guard let collectionView = collectionView else {
            return
        }
        // Add subviews

        // Add an empty custom Navigation Bar to show Collection View Refresh Control just upper the cells but not in Navigation Bar
        // view.addSubview(navigationBar)
        view.addSubview(collectionView)

        // Set constraints

        let safeArea = view.safeAreaLayoutGuide
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }

    // MARK: Load data

    private func loadData(completion: (() -> Void)? = nil) {
        let catalogDataFactory: CatalogDataRequestFactory = AppDelegate.requestFactory.makeCatalogDataRequestFactory()

        catalogDataFactory.catalogData(id: "1", pageNumber: "1") { response in
            switch response.result {
            case .success(let model):
                print(model)

                let goods: [GoodData] = model.map { GoodData(resultElement: $0) }
                DispatchQueue.main.async { [weak self] in
                    self?.goods.removeAll()
                    self?.goods = goods
                    self?.collectionView?.reloadData()
                    completion?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: Pull-to-refresh pattern

    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(
            string: NSLocalizedString("reloadData", comment: ""),
            attributes: [.font: UIFont.refreshControlFont]
        )
        refreshControl.tintColor = UIColor.refreshControlTintColor

        refreshControl.addTarget(
            self,
            action: #selector(refresh(_:)),
            for: .valueChanged
        )
        collectionView?.refreshControl = refreshControl
    }

}
