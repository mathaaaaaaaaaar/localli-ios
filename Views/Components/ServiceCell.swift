//
//  ServiceCell.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// File: ServiceCell.swift

import UIKit

class ServiceCell: UITableViewCell {
    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = 12
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.1
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.layer.shadowRadius = 4
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let servicesLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let ratingLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let distanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(servicesLabel)
        cardView.addSubview(ratingLabel)
        cardView.addSubview(distanceLabel)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            servicesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            servicesLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            ratingLabel.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            distanceLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            distanceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(name: String, services: String, rating: String, distance: String) {
        nameLabel.text = name
        servicesLabel.text = services
        ratingLabel.text = "⭐️ \(rating)"
        distanceLabel.text = distance
    }
}
