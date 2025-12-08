//
//  BookingHistoryCell.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

import UIKit
// Booking History Cell
class BookingHistoryCell: UITableViewCell {
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

    private let serviceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let businessLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let datetimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.addSubview(serviceLabel)
        cardView.addSubview(businessLabel)
        cardView.addSubview(datetimeLabel)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            serviceLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            serviceLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            businessLabel.topAnchor.constraint(equalTo: serviceLabel.bottomAnchor, constant: 4),
            businessLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),

            datetimeLabel.topAnchor.constraint(equalTo: businessLabel.bottomAnchor, constant: 8),
            datetimeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(service: String, business: String, datetime: String, isPast: Bool) {
        serviceLabel.text = service
        businessLabel.text = business
        datetimeLabel.text = "📅 \(datetime)"
        datetimeLabel.textColor = isPast ? .secondaryLabel : .systemBlue
    }
}

