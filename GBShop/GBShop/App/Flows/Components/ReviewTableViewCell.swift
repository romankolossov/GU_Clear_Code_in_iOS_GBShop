//
//  ReviewListTableViewCell.swift
//  GBShop
//
//  Created by Roman Kolosov on 22.03.2021.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    // MARK: - Public properties

    let idUserLabel = UILabel()
    let idCommentLabel = UILabel()
    let commentTextLabel = UILabel()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func lookConfigure(with review: ReviewData) {
        idUserLabel.text = String(review.idUser)
        idCommentLabel.text = String(review.idComment)
        commentTextLabel.text = review.commentText
    }

    // MARK: - Private methods

    // MARK: Configure

    private func configureCell() {
        self.backgroundColor = .reviewCellBackgroundColor

        self.layer.borderWidth = .reviewCellBorderWidth
        self.layer.borderColor = UIColor.reviewCellBorderColor.cgColor
        self.layer.cornerRadius = .reviewCellCornerRadius

        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        idUserLabel.textColor = .reviewLableTextColor
        idUserLabel.textAlignment = .center
        idUserLabel.font = .reviewLableFont
        idUserLabel.translatesAutoresizingMaskIntoConstraints = false

        idCommentLabel.textColor = .reviewLableTextColor
        idCommentLabel.textAlignment = .center
        idCommentLabel.font = .reviewLableFont
        idCommentLabel.translatesAutoresizingMaskIntoConstraints = false

        commentTextLabel.textColor = .reviewLableTextColor
        commentTextLabel.textAlignment = .center
        commentTextLabel.font = .reviewLableFont
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add subviews

        contentView.addSubview(idUserLabel)
        contentView.addSubview(idCommentLabel)
        contentView.addSubview(commentTextLabel)
    }

    private func setupConstraints() {
        let indent: CGFloat = 11.0
        let safeArea = contentView.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            idUserLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: indent),
            idUserLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            idUserLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent),

            idCommentLabel.topAnchor.constraint(equalTo: idUserLabel.bottomAnchor, constant: indent),
            idCommentLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            idCommentLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent),

            commentTextLabel.topAnchor.constraint(equalTo: idCommentLabel.bottomAnchor, constant: indent),
            commentTextLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: indent),
            commentTextLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -indent)
        ])
    }

    // Reserve.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
