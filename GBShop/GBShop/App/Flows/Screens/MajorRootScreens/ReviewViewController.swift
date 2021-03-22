//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 08.03.2021.
//

import UIKit

// Displaying review list, adding review and  removing review.

class ReviewViewController: UIViewController {

    // MARK: - Public properties

    let reviewCellIdentifier: String = "ReviewsCellIdentifier"
    var reviews: [ReviewData] = []
    var filteredReviews: [ReviewData] = []

    // MARK: - Private properties

    private (set) lazy var tableView: UITableView = {
        let safeArea = view.safeAreaLayoutGuide
        let tv = UITableView(frame: safeArea.layoutFrame)

        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.goodsCollectionViewBackgroundColor

        tv.dataSource = self
        tv.delegate = self

        tv.register(ReviewTableViewCell.self, forCellReuseIdentifier: reviewCellIdentifier)
        return tv
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureReviewVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    // MARK: - Actions

    @objc private func addReview() {
        // MARK: TO DO
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureReviewVC() {
        navigationItem.title = NSLocalizedString("reviewVCName", comment: "Review")
        view.backgroundColor = UIColor.rootVCViewBackgroundColor
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        configureNavigationVC()
        addSubviews()
        setupConstraints()
    }

    private func configureNavigationVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        navigationController?.navigationBar.tintColor = .white

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        // Create addReviewItem in navigation item of navigation bar.
        let addReviewItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.bubble"),
            style: .plain,
            target: self,
            action: #selector(addReview)
        )
        navigationItem.rightBarButtonItems = [addReviewItem]
    }

    private func addSubviews() {
        // Add an empty custom navigation bar before adding collection view to show collection view refresh control just above the cells but not in navigation bar.
        // let navigationBar = UINavigationBar()
        // view.addSubview(navigationBar)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }

    // MARK: Load data

    private func loadData(completion: (() -> Void)? = nil) {
        let reviewListFactory: ReviewListRequestFactory = AppDelegate.requestFactory.makeReviewListRequestFactory()

        reviewListFactory.reviewList(idUser: 1, pageNumber: 1) { response in
            switch response.result {
            case .success(let model):
                #if DEBUG
                print(model)
                #endif
                let reviews: [ReviewData] = model.map {
                    ReviewData(reviewElement: $0)
                }
                DispatchQueue.main.async { [weak self] in
                    self?.reviews.removeAll()
                    self?.reviews = reviews
                    self?.tableView.reloadData()
                    completion?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
