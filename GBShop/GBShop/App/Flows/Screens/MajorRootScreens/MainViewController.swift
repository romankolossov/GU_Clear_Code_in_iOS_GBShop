//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit
import OSLog
import FirebaseAnalytics

// Signing in and signing up.

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate, RemoveAddableToCart {

    // MARK: - Public properties

    let goodsCellIdentifier: String = "GoodsCellIdentifier"
    var goods: [GoodData] = []
    var filteredGoods: [GoodData] = []

    // MARK: - Private properties

    private(set) lazy var collectionView: UICollectionView = {
        let layout = GoodsLayout()
        let safeArea = view.safeAreaLayoutGuide

        let cv = UICollectionView(
            frame: safeArea.layoutFrame,
            collectionViewLayout: layout
        )
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .goodsCollectionViewBackgroundColor

        cv.dataSource = self
        cv.delegate = self

        cv.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: goodsCellIdentifier)
        return cv
    }()
    private(set) lazy var searchController: UISearchController = {
        let sc = UISearchController()
        sc.delegate = self // Monitor when search controller is dismissed.
        sc.searchResultsUpdater = self
        sc.searchBar.autocapitalizationType = .none
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.delegate = self // Monitor when the cancel button is tapped.
        // Place the search bar in the navigation bar.
        navigationItem.searchController = sc
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        sc.searchBar.placeholder = NSLocalizedString("typeGoodNameToSearch", comment: "")
        sc.searchBar.searchTextField.backgroundColor = .searchTextFieldBackgroundColor
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
        Analytics.logEvent(AnalyticsEventViewItemList, parameters: [
            AnalyticsParameterItemName: "goodsListOpen",
            AnalyticsParameterSuccess: "goodsListWasOpen"
        ])
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
        loadData { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureMainVC() {
        navigationItem.title = NSLocalizedString("mainVCName", comment: "GBBERRIES")
        view.backgroundColor = .rootVCViewBackgroundColor
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
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.tintColor = .navigationControllerNBarTintColor
        navigationController?.navigationBar.backgroundColor = .navigationBarBackgroundColor

        // Create registerNewUserItem and signInItem in navigation item of navigation bar.
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
        // For use in UI tests.
        signInItem.accessibilityIdentifier = "signInBarButtonItem"
        navigationItem.rightBarButtonItems = [registerNewUserItem, signInItem]
    }

    private func addSubviews() {
        // Add an empty custom navigation bar before adding collection view to show collection view refresh control just above the cells but not in navigation bar.
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
                Logger.viewCycle.debug("\(model)")

                let goods: [GoodData] = model.map {
                    GoodData(goodElement: $0)
                }
                DispatchQueue.main.async { [weak self] in
                    self?.goods.removeAll()
                    self?.goods = goods
                    self?.collectionView.reloadData()
                    completion?()
                }
            case .failure(let error):
                Logger.viewCycle.debug("\(error.localizedDescription)")
            }
        }
    }

    // MARK: Pull-to-refresh pattern

    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(
            string: NSLocalizedString("reloadGoodData", comment: ""),
            attributes: [.font: UIFont.refreshControlFont]
        )
        refreshControl.tintColor = .refreshControlTintColor

        refreshControl.addTarget(
            self,
            action: #selector(refresh(_:)),
            for: .valueChanged
        )
        // Place the refresh control in the collection view.
        collectionView.refreshControl = refreshControl
    }

    // MARK: - Delegates methods

    // MARK: UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            return
        }
        let options: NSString.CompareOptions = [
            .caseInsensitive
        ]
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.filteredGoods.removeAll()
            self.filteredGoods = self.goods.filter { element in
                element.productName.range(of: text, options: options) != nil
            }
            self.collectionView.reloadData()
        }
    }

    // MARK: UISearchBarDelegate

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Use searchBarCancelButtonClicked additionally to didDismissSearchController because of better animation when cancel button is clicked.
        collectionView.reloadData()
    }

    // MARK: UISearchControllerDelegate

    func didDismissSearchController(_ searchController: UISearchController) {
        collectionView.reloadData()
    }

}
