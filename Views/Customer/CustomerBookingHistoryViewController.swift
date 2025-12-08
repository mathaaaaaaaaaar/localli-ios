//
//  CustomerBookingHistoryViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// ==========================================
// S12: CUSTOMER BOOKING HISTORY
// File: CustomerBookingHistoryViewController.swift
// ==========================================

import UIKit

class CustomerBookingHistoryViewController: UIViewController {

    private let segmentedControl: UISegmentedControl = {
        let items = ["Upcoming", "Past"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()

    private let upcomingBookings = [
        ("Haircut", "Mike's Barber Shop", "Dec 15, 2:00 PM"),
        ("Cleaning", "SparkleClean", "Dec 18, 10:00 AM")
    ]

    private let pastBookings = [
        ("Haircut", "Mike's Barber Shop", "Nov 20, 3:00 PM"),
        ("Beard Trim", "Classic Cuts", "Nov 15, 11:00 AM")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "My Bookings"
        setupViews()
        setupTableView()
    }

    private func setupViews() {
        view.addSubview(segmentedControl)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookingHistoryCell.self, forCellReuseIdentifier: "BookingHistoryCell")
    }

    @objc private func segmentChanged() {
        tableView.reloadData()
    }
}

extension CustomerBookingHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControl.selectedSegmentIndex == 0 ? upcomingBookings.count : pastBookings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingHistoryCell", for: indexPath) as! BookingHistoryCell
        let bookings = segmentedControl.selectedSegmentIndex == 0 ? upcomingBookings : pastBookings
        let booking = bookings[indexPath.row]
        cell.configure(service: booking.0, business: booking.1, datetime: booking.2, isPast: segmentedControl.selectedSegmentIndex == 1)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
