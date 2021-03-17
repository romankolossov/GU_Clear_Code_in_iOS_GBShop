//
//  CustomGoodsCollectionViewCell.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.03.2021.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {

    // Some properties
    let idLabel = UILabel()
    let productNameLabel = UILabel()
    let priceLabel = UILabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

    private func configureCell() {
        self.backgroundColor = .red

        self.addSubviews()
        self.setupConstraints()
    }

    private func addSubviews() {

        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.textColor = UIColor.userLableTextColor
        idLabel.textAlignment = .center
        idLabel.font = UIFont.userLableFont

        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.textColor = UIColor.userLableTextColor
        productNameLabel.textAlignment = .center
        productNameLabel.font = UIFont.userLableFont

        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor.userLableTextColor
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.userLableFont

        self.contentView.addSubview(idLabel)
        self.contentView.addSubview(productNameLabel)
        self.contentView.addSubview(priceLabel)
    }

    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        let indent: CGFloat = 11.0

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: indent),
            idLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            idLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent),

            productNameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: indent),
            productNameLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            productNameLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent),

            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: indent),
            priceLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            priceLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent)
        ])
    }

    func lookConfigure(with good: CatalogDataResultElement) {
        idLabel.text = String(good.idProduct)

        productNameLabel.text = good.productName
        priceLabel.text = String(good.price)
    }

}