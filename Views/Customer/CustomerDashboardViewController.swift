//
//  CustomerDashboardViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// File: CustomerDashboardViewController.swift
import UIKit

class CustomerDashboardViewController: UIViewController {

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

    private let greetingLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello, John!"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "📍 Toronto, ON"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search for services..."
        sb.searchBarStyle = .minimal
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()

    private let categoriesLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Categories"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    private let nearbyLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Nearby Services"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let servicesTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()

    private let categories = [
        ("Barber", "scissors"),
        ("Salon", "sparkles"),
        ("Cleaner", "hands.sparkles.fill"),
        ("Tutor", "book.fill"),
        ("Mechanic", "wrench.fill"),
        ("Plumber", "drop.fill")
    ]

    private let nearbyServices = [
        ("Mike's Barber Shop", "Haircut, Shave, Beard Trim", "4.8", "0.5 km"),
        ("Glam Beauty Salon", "Hair, Nails, Makeup", "4.9", "1.2 km"),
        ("SparkleClean Services", "Home & Office Cleaning", "4.7", "0.8 km"),
        ("Math Tutoring Pro", "Math, Science, Physics", "5.0", "1.5 km")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavBar()
        setupViews()
        setupCollectionView()
        setupTableView()
    }

    private func setupNavBar() {
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(notificationsTapped)
        )
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(greetingLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(searchBar)
        contentView.addSubview(categoriesLabel)
        contentView.addSubview(categoriesCollectionView)
        contentView.addSubview(nearbyLabel)
        contentView.addSubview(servicesTableView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            greetingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            locationLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            searchBar.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            categoriesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 12),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100),

            nearbyLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 24),
            nearbyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            servicesTableView.topAnchor.constraint(equalTo: nearbyLabel.bottomAnchor, constant: 12),
            servicesTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            servicesTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            servicesTableView.heightAnchor.constraint(equalToConstant: 400),
            servicesTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func setupCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
    }

    private func setupTableView() {
        servicesTableView.delegate = self
        servicesTableView.dataSource = self
        servicesTableView.register(ServiceCell.self, forCellReuseIdentifier: "ServiceCell")
    }

    @objc private func notificationsTapped() {
        print("Notifications tapped")
    }
}

extension CustomerDashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.item]
        cell.configure(with: category.0, icon: category.1)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item].0
        let listingVC = ServiceListingsViewController(category: category)
        navigationController?.pushViewController(listingVC, animated: true)
    }
}

extension CustomerDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearbyServices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        let service = nearbyServices[indexPath.row]
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
