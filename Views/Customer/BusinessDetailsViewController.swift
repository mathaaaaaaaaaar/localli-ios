//
//  BusinessDetailsViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// ==========================================
// S08: BUSINESS DETAILS
// File: BusinessDetailsViewController.swift
// ==========================================

import UIKit

class BusinessDetailsViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let headerImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray4
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let businessNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mike's Barber Shop"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let ratingLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "⭐️ 4.8 (120 reviews)"
        lbl.font = .systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "📍 123 Main St, Toronto, ON"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Professional barbershop offering traditional and modern haircuts, beard trims, and grooming services."
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let servicesLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Services"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let servicesTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.isScrollEnabled = false
        return tv
    }()

    private let hoursLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Business Hours"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let hoursTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mon-Fri: 9:00 AM - 6:00 PM\nSat: 10:00 AM - 4:00 PM\nSun: Closed"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let services = [
        ("Haircut", "$25", "30 min"),
        ("Beard Trim", "$15", "15 min"),
        ("Hair & Beard", "$35", "45 min")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupTableView()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(headerImageView)
        contentView.addSubview(businessNameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(servicesLabel)
        contentView.addSubview(servicesTableView)
        contentView.addSubview(hoursLabel)
        contentView.addSubview(hoursTextLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            headerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 200),

            businessNameLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 16),
            businessNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            ratingLabel.topAnchor.constraint(equalTo: businessNameLabel.bottomAnchor, constant: 4),
            ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            addressLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            servicesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            servicesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            servicesTableView.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 12),
            servicesTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            servicesTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            servicesTableView.heightAnchor.constraint(equalToConstant: 240),

            hoursLabel.topAnchor.constraint(equalTo: servicesTableView.bottomAnchor, constant: 24),
            hoursLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            hoursTextLabel.topAnchor.constraint(equalTo: hoursLabel.bottomAnchor, constant: 8),
            hoursTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hoursTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func setupTableView() {
        servicesTableView.delegate = self
        servicesTableView.dataSource = self
        servicesTableView.register(ServiceDetailCell.self, forCellReuseIdentifier: "ServiceDetailCell")
    }
}

extension BusinessDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceDetailCell", for: indexPath) as! ServiceDetailCell
        let service = services[indexPath.row]
        cell.configure(name: service.0, price: service.1, duration: service.2)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let serviceVC = ServiceDetailsViewController()
        navigationController?.pushViewController(serviceVC, animated: true)
    }
}
