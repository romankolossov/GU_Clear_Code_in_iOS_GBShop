//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 08.03.2021.
//

import UIKit

// for display Review list, Add review and  Remove review

class ReviewViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait
        configureReviewVC()
    }

    // MARK: - Actions

    @objc private func addReview() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureReviewVC() {
        navigationItem.title = NSLocalizedString("reviewVCName", comment: "Review")
        self.view.backgroundColor = UIColor.rootVCViewBackgroundColor

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.navigationBarLargeTitleTextColor
        ]
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.navigationBarBackgroundColor

        // Create addReviewItem in Navigation Item of Navigation Bar

        let addReviewItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.bubble"),
            style: .plain,
            target: self,
            action: #selector(addReview)
        )
        navigationItem.rightBarButtonItems = [addReviewItem]
    }

}
