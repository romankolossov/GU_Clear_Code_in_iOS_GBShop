//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

// for Sign in and Sign up

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {

    // MARK: - Public properties

    let goodsCellIdentifier: String = "GoodsCellIdentifier"
    var goods: [GoodData] = []
    var filteredGoods: [GoodData] = []

    // MARK: - Private properties

    private (set) lazy var collectionView: UICollectionView = {
        let layout = GoodsLayout()
        let safeArea = view.safeAreaLayoutGuide

        let cv = UICollectionView(
            frame: safeArea.layoutFrame,
            collectionViewLayout: layout
        )
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.goodsCollectionViewBackgroundColor

        cv.dataSource = self
        cv.delegate = self

        cv.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: goodsCellIdentifier)
        return cv
    }()
    private (set) lazy var searchController: UISearchController = {
        let sc = UISearchController()
        sc.delegate = self
        sc.searchResultsUpdater = self
        sc.searchBar.autocapitalizationType = .none
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.delegate = self // Monitor when the search button is tapped.
        // Place the search bar in the navigation bar.
        navigationItem.searchController = sc
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        sc.searchBar.placeholder = "Type good to search"
        return sc
    }()
    private let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    // MARK: - Actions

    @objc private func signUp() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .formSheet

        navigationController?.present(
            signUpViewController,
            animated: true,
            completion: nil
        )
    }

    @objc private func signIn() {
        let signInViewController = SignInViewController()
        signInViewController.modalPresentationStyle = .formSheet

        navigationController?.present(
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
        navigationItem.title = NSLocalizedString("mainVCName", comment: "GBBERRIES")
        view.backgroundColor = UIColor.rootVCViewBackgroundColor
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureNavigationVC()
        addSubviews()
        setupConstraints()
        setupRefreshControl()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.tintColor = .white

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

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

    private func addSubviews() {
        // Add an empty custom Navigation Bar before adding Collection View to show Collection View Refresh Control just above the cells but not in Navigation Bar
        // let navigationBar = UINavigationBar()
        // view.addSubview(navigationBar)
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
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
                #if DEBUG
                print(model)
                #endif

                let goods: [GoodData] = model.map { GoodData(resultElement: $0) }
                DispatchQueue.main.async { [weak self] in
                    self?.goods.removeAll()
                    self?.goods = goods
                    self?.collectionView.reloadData()
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
        collectionView.refreshControl = refreshControl
    }

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            return
        }
        let predicate = NSPredicate(format: "SELF.productName CONTAINS[cd] %@", text)

        let nsGoods = NSArray(array: goods)
        filteredGoods = nsGoods.filtered(using: predicate) as? [GoodData] ?? []

        // searchedGoods = (goods as NSArray).filtered(using: predicate) as? [GoodData] ?? []
        collectionView.reloadData()
    }

}
