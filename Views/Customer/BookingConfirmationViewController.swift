//
//  BookingConfirmationViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// ==========================================
// S11: BOOKING CONFIRMATION
// File: BookingConfirmationViewController.swift
// ==========================================

import UIKit

class BookingConfirmationViewController: UIViewController {

    private let checkmarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "checkmark.circle.fill")
        iv.tintColor = .systemGreen
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Booking Confirmed!"
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your appointment has been successfully booked."
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let detailsCard: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 12
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let serviceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Service: Haircut"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let businessLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Business: Mike's Barber Shop"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Date: December 15, 2024"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Time: 2:00 PM"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let viewBookingsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("View My Bookings", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Done", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        setupViews()
    }

    private func setupViews() {
        view.addSubview(checkmarkImageView)
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(detailsCard)
        detailsCard.addSubview(serviceLabel)
        detailsCard.addSubview(businessLabel)
        detailsCard.addSubview(dateLabel)
        detailsCard.addSubview(timeLabel)
        view.addSubview(viewBookingsButton)
        view.addSubview(doneButton)

        NSLayoutConstraint.activate([
            checkmarkImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            checkmarkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 100),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 100),

            titleLabel.topAnchor.constraint(equalTo: checkmarkImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            detailsCard.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40),
            detailsCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            serviceLabel.topAnchor.constraint(equalTo: detailsCard.topAnchor, constant: 20),
            serviceLabel.leadingAnchor.constraint(equalTo: detailsCard.leadingAnchor, constant: 20),

            businessLabel.topAnchor.constraint(equalTo: serviceLabel.bottomAnchor, constant: 12),
            businessLabel.leadingAnchor.constraint(equalTo: detailsCard.leadingAnchor, constant: 20),

            dateLabel.topAnchor.constraint(equalTo: businessLabel.bottomAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: detailsCard.leadingAnchor, constant: 20),

            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            timeLabel.leadingAnchor.constraint(equalTo: detailsCard.leadingAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: detailsCard.bottomAnchor, constant: -20),

            viewBookingsButton.topAnchor.constraint(equalTo: detailsCard.bottomAnchor, constant: 40),
            viewBookingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewBookingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewBookingsButton.heightAnchor.constraint(equalToConstant: 50),

            doneButton.topAnchor.constraint(equalTo: viewBookingsButton.bottomAnchor, constant: 16),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        viewBookingsButton.addTarget(self, action: #selector(viewBookingsTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
    }

    @objc private func viewBookingsTapped() {
        let historyVC = CustomerBookingHistoryViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }

    @objc private func doneTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
