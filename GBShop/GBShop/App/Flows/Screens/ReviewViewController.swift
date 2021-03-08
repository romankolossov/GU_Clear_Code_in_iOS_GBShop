//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Roman Kolosov on 08.03.2021.
//

import UIKit

class ReviewViewController: UIViewController {
    // MARK: TO DO: Review list
    // MARK: TO DO: Add review
    // MARK: TO DO: Remove review

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as? AppDelegate)?.restrictRotation = .portrait

        self.configureReviewVC()
    }

    // MARK: - Actions

    @objc private func addReview() {
        // MARK: TO DO

    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureReviewVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .init(red: 102 / 255, green: 26 / 255, blue: 136 / 255, alpha: 1.0)

        let addReviewItem = UIBarButtonItem(image: UIImage(systemName: "plus.bubble"), style: .plain, target: self, action: #selector(addReview))

        navigationItem.rightBarButtonItems = [addReviewItem]

        self.title = "Review"
        self.tabBarItem.title = nil
        self.view.backgroundColor = .systemPurple
    }

}
