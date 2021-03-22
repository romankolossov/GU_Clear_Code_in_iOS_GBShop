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
        reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reviewCellIdentifier, for: indexPath) as? ReviewTableViewCell else {
            fatalError(description)
        }
        let reviewData: ReviewData = reviews[indexPath.row]

        cell.lookConfigure(with: reviewData)

        return cell
    }

    // MARK: - UITableViewDelegate protocol methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .reviewCellHeight
    }

}
