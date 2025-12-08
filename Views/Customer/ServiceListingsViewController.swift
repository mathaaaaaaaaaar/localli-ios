//
//  ServiceListingsViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// ==========================================
// S07: SERVICE LISTINGS
// File: ServiceListingsViewController.swift
// ==========================================

import UIKit

class ServiceListingsViewController: UIViewController {

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()

    private let category: String

    private let services = [
        ("Mike's Barber Shop", "Haircut, Shave, Beard Trim", "4.8", "0.5 km"),
        ("Classic Cuts", "Traditional Barbering", "4.7", "1.0 km"),
        ("Modern Edge Barbers", "Contemporary Styles", "4.9", "1.8 km"),
        ("The Gentlemen's Shop", "Premium Grooming", "5.0", "2.2 km")
    ]

    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = category
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ServiceCell.self, forCellReuseIdentifier: "ServiceCell")
    }
}

extension ServiceListingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        let service = services[indexPath.row]
        cell.configure(name: service.0, services: service.1, rating: service.2, distance: service.3)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let businessVC = BusinessDetailsViewController()
        navigationController?.pushViewController(businessVC, animated: true)
    }
}
