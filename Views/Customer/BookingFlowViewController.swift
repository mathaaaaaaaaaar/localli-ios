//
//  BookingFlowViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 07/12/25.
//

// ==========================================
// S10: BOOKING FLOW
// File: BookingFlowViewController.swift
// ==========================================

import UIKit

class BookingFlowViewController: UIViewController {

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

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Book Appointment"
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let serviceInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Haircut at Mike's Barber Shop"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let selectDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Date"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.preferredDatePickerStyle = .inline
        dp.minimumDate = Date()
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()

    private let selectTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Time"
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let timeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = false
        return cv
    }()

    private let notesTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Add notes (optional)"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let confirmButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Confirm Booking", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let timeSlots = ["9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
                             "12:00 PM", "12:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM"]
    private var selectedTimeIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Book"
        setupViews()
        setupCollectionView()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(titleLabel)
        contentView.addSubview(serviceInfoLabel)
        contentView.addSubview(selectDateLabel)
        contentView.addSubview(datePicker)
        contentView.addSubview(selectTimeLabel)
        contentView.addSubview(timeCollectionView)
        contentView.addSubview(notesTextField)
        contentView.addSubview(confirmButton)

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

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            serviceInfoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            serviceInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            serviceInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            selectDateLabel.topAnchor.constraint(equalTo: serviceInfoLabel.bottomAnchor, constant: 24),
            selectDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            datePicker.topAnchor.constraint(equalTo: selectDateLabel.bottomAnchor, constant: 12),
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            selectTimeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 24),
            selectTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            timeCollectionView.topAnchor.constraint(equalTo: selectTimeLabel.bottomAnchor, constant: 12),
            timeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            timeCollectionView.heightAnchor.constraint(equalToConstant: 250),

            notesTextField.topAnchor.constraint(equalTo: timeCollectionView.bottomAnchor, constant: 24),
            notesTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            notesTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            notesTextField.heightAnchor.constraint(equalToConstant: 50),

            confirmButton.topAnchor.constraint(equalTo: notesTextField.bottomAnchor, constant: 24),
            confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            confirmButton.heightAnchor.constraint(equalToConstant: 56),
            confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])

        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
    }

    private func setupCollectionView() {
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
        timeCollectionView.register(TimeSlotCell.self, forCellWithReuseIdentifier: "TimeSlotCell")
    }

    @objc private func confirmTapped() {
        let confirmationVC = BookingConfirmationViewController()
        navigationController?.pushViewController(confirmationVC, animated: true)
    }
}

extension BookingFlowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeSlots.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotCell", for: indexPath) as! TimeSlotCell
        cell.configure(time: timeSlots[indexPath.item], isSelected: selectedTimeIndex == indexPath.item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTimeIndex = indexPath.item
        collectionView.reloadData()
    }
}
