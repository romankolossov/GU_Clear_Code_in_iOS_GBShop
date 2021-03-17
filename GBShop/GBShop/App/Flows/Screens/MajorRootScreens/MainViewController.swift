//
//  MainViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

// for Sign in and Sign up

class MainViewController: UIViewController {

    private var collectionView: UICollectionView?
    var isLoading: Bool = false
    var goods: [CatalogDataResultElement] = []

    private let goodsCellIdentifier: String = "GoodsCellIdentifier"
    var publicGoodsCellIdentifier: String {
        goodsCellIdentifier
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureMainVC()
        configureCollectionView()
        configureSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    // MARK: - Actions

    @objc private func signUp() {
        let signUpViewController = SignUpViewController()

        signUpViewController.modalPresentationStyle = .formSheet
        self.navigationController?.present(signUpViewController, animated: true, completion: nil)
    }
    @objc private func signIn() {
        let signInViewController = SignInViewController()

        signInViewController.modalPresentationStyle = .formSheet
        self.navigationController?.present(signInViewController, animated: true, completion: nil)
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureMainVC() {
        navigationItem.title = NSLocalizedString("mainVCName", comment: "GB Shop")

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

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

        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor
        self.tabBarItem.title = nil
    }

    private func configureCollectionView() {

        // Custom layout
        let layout = PhotoLayout()

        let safeArea = view.safeAreaLayoutGuide
        collectionView = UICollectionView(
            frame: safeArea.layoutFrame,
            collectionViewLayout: layout
        )
        collectionView?.translatesAutoresizingMaskIntoConstraints = false

        collectionView?.dataSource = self
        collectionView?.delegate = self

        // collectionView?.prefetchDataSource = self
        collectionView?.backgroundColor = .blue

        collectionView?.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: publicGoodsCellIdentifier)
    }

    private func configureSubviews() {
        guard let collectionSubview = collectionView else {
            return
        }
        view.addSubview(collectionSubview)

        let safeArea = view.safeAreaLayoutGuide
        let collectionSubviewConstraints = [
            collectionSubview.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionSubview.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            collectionSubview.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            collectionSubview.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(collectionSubviewConstraints)
    }

    private func loadData() {
        let catalogDataFactory: CatalogDataRequestFactory = AppDelegate.requestFactory.makeCatalogDataRequestFactory()

        catalogDataFactory.catalogData(id: "1", pageNumber: "1") { response in

            switch response.result {
            case .success(let model):
                print(model)
                // let photos: [PhotoData] = photoItems.map { PhotoData(photoItem: $0) }
                DispatchQueue.main.async { [weak self] in
                    self?.goods = model
                    self?.collectionView?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
