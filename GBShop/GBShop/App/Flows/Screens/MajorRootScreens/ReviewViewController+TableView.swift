//
//  ReviewViewController+TableView.swift
//  GBShop
//
//  Created by Roman Kolosov on 22.03.2021.
//

import UIKit

extension ReviewViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - UITableViewDataSource protocol methods

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard searchController.isActive else {
            return reviews.count
        }
        return filteredReviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reviewCellIdentifier, for: indexPath) as? ReviewTableViewCell else {
            fatalError(description)
        }
        let reviewData: ReviewData = searchController.isActive ?
            filteredReviews[indexPath.row] :
            reviews[indexPath.row]

        cell.lookConfigure(with: reviewData)

        return cell
    }

    // MARK: - UITableViewDelegate protocol methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .reviewCellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard searchController.isActive else {
            // TO DO send via delegate review data to good details screen.
            print(reviews[indexPath.row])
            return
        }
        // TO DO send via delegate searched review data to good details screen.
        print(filteredReviews[indexPath.row])
        searchController.isActive = false
    }

}
