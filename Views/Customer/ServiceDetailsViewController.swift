//
//  ServiceDetailsViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

import UIKit

class ServiceDetailsViewController: UIViewController {

    var serviceName: String = ""
    var price: String = ""
    var duration: String = ""

    private let bookButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = serviceName

        setupUI()
        setupButton()
    }

    private func setupUI() {
        let nameLabel = UILabel()
        nameLabel.text = serviceName
        nameLabel.font = .boldSystemFont(ofSize: 24)

        let priceLabel = UILabel()
        priceLabel.text = "Price: \(price)"
        priceLabel.font = .systemFont(ofSize: 18)

        let durationLabel = UILabel()
        durationLabel.text = "Duration: \(duration)"
        durationLabel.font = .systemFont(ofSize: 18)

        let stack = UIStackView(arrangedSubviews: [nameLabel, priceLabel, durationLabel])
        stack.axis = .vertical
        stack.spacing = 16
        stack.frame = CGRect(x: 24, y: 120, width: view.frame.width - 48, height: 150)
        view.addSubview(stack)
    }

    private func setupButton() {
        bookButton.setTitle("Book Appointment", for: .normal)
        bookButton.backgroundColor = .black
        bookButton.tintColor = .white
        bookButton.layer.cornerRadius = 12
        bookButton.frame = CGRect(x: 24, y: view.frame.height - 120, width: view.frame.width - 48, height: 54)
        bookButton.addTarget(self, action: #selector(bookTapped), for: .touchUpInside)
        view.addSubview(bookButton)
    }

    @objc private func bookTapped() {
        let vc = BookingFlowViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
