//
//  ServiceDetailsCell.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// Service Detail Cell

import UIKit

class ServiceDetailCell: UITableViewCell {
    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = 12
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.systemGray5.cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .systemBlue
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let durationLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(priceLabel)
        cardView.addSubview(durationLabel)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            durationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            durationLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            priceLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(name: String, price: String, duration: String) {
        nameLabel.text = name
        priceLabel.text = price
        durationLabel.text = "⏱ \(duration)"
    }
}
