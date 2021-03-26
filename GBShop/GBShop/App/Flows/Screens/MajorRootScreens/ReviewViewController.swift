//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 08.03.2021.
//

import UIKit
import OSLog

// Displaying review list, adding review and  removing review.

class ReviewViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    // MARK: - Public properties

    let reviewCellIdentifier: String = "ReviewsCellIdentifier"
    var reviews: [ReviewData] = []
    var filteredReviews: [ReviewData] = []

    // MARK: - Private properties

    private(set) lazy var tableView: UITableView = {
        let safeArea = view.safeAreaLayoutGuide
        let tv = UITableView(frame: safeArea.layoutFrame)

        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.goodsCollectionViewBackgroundColor

        tv.dataSource = self
        tv.delegate = self

        tv.register(ReviewTableViewCell.self, forCellReuseIdentifier: reviewCellIdentifier)
        return tv
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
        sc.searchBar.placeholder = NSLocalizedString("typeGoodNameToSearchReview", comment: "")
        sc.searchBar.searchTextField.backgroundColor = .searchTextFieldBackgroundColor
        return sc
    }()
    private let refreshControl = UIRefreshControl()

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

    @objc private func refresh(_ sender: UIRefreshControl) {
        loadData { [weak self] in
            self?.refreshControl.endRefreshing()
        }
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
                Logger.viewCycle.debug("\(model)")

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
                Logger.viewCycle.debug("\(error.localizedDescription)")
            }
        }
    }

    // MARK: Pull-to-refresh pattern

    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(
            string: NSLocalizedString("reloadReviewData", comment: ""),
            attributes: [.font: UIFont.refreshControlFont]
        )
        refreshControl.tintColor = UIColor.refreshControlTintColor

        refreshControl.addTarget(
            self,
            action: #selector(refresh(_:)),
            for: .valueChanged
        )
        // Place the refresh control in the table view.
        tableView.refreshControl = refreshControl
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
            self.filteredReviews.removeAll()
            self.filteredReviews = self.reviews.filter { element in
                element.commentText.range(of: text, options: options) != nil
            }
            self.tableView.reloadData()
        }
    }

    // MARK: UISearchBarDelegate

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Use searchBarCancelButtonClicked additionally to didDismissSearchController because of better animation when cancel button is clicked.
        tableView.reloadData()
    }

    // MARK: UISearchControllerDelegate

    func didDismissSearchController(_ searchController: UISearchController) {
        tableView.reloadData()
    }

}
