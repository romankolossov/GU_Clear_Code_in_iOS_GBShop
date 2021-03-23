//
//  MainViewController+CollectionView.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.03.2021.
//

import UIKit
import OSLog

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource protocol methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard searchController.isActive else {
            return goods.count
        }
        return filteredGoods.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: goodsCellIdentifier,
                for: indexPath
        ) as? GoodsCollectionViewCell else {
            fatalError(description)
        }
        let goodData: GoodData = searchController.isActive ?
            filteredGoods[indexPath.row] :
            goods[indexPath.row]

        cell.lookConfigure(with: goodData)
        return cell
    }

    // MARK: - UICollectionViewDelegate protocol methods

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard searchController.isActive else {
            // TO DO send via delegate good data to good details screen.
            Logger.viewCycle.debug("\(self.goods[indexPath.row])")
            return
        }
        // TO DO send via delegate searched good data to good details screen.
        searchController.isActive = false
        Logger.viewCycle.debug("\(self.filteredGoods[indexPath.row])")
    }

}
