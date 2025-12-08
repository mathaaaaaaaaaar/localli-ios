//
//  TimeSlotCell.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// Time Slot Cell

import UIKit

class TimeSlotCell: UICollectionViewCell {
    private let timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(time: String, isSelected: Bool) {
        timeLabel.text = time
        if isSelected {
            contentView.backgroundColor = .systemBlue
            contentView.layer.borderColor = UIColor.systemBlue.cgColor
            timeLabel.textColor = .white
        } else {
            contentView.backgroundColor = .systemGray6
            contentView.layer.borderColor = UIColor.systemGray4.cgColor
            timeLabel.textColor = .label
        }
    }
}
