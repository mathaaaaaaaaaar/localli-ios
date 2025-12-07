//
//  OnboardingViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 06/12/25.
//

// ==========================================
// S01: ONBOARDING SCREEN
// ==========================================

import UIKit

class OnboardingViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 0
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .systemBlue
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()

    private let skipButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Skip", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let slides = [
        ("Welcome to Localli", "Book trusted neighbourhood services instantly", "house.fill"),
        ("Discover Services", "Find local barbers, cleaners, tutors and more near you", "magnifyingglass"),
        ("Easy Booking", "Schedule appointments with just a few taps", "calendar"),
        ("Get Started", "Choose your role to continue", "person.2.fill")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupSlides()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 500),

            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        scrollView.delegate = self
    }

    private func setupSlides() {
        for (index, slide) in slides.enumerated() {
            let slideView = createSlideView(title: slide.0, description: slide.1, imageName: slide.2)
            slideView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 500)
            scrollView.addSubview(slideView)
        }
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 500)
    }

    private func createSlideView(title: String, description: String, imageName: String) -> UIView {
        let view = UIView()

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: imageName)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let descLabel = UILabel()
        descLabel.text = description
        descLabel.font = .systemFont(ofSize: 16)
        descLabel.textAlignment = .center
        descLabel.textColor = .secondaryLabel
        descLabel.numberOfLines = 0
        descLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descLabel)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

        return view
    }

    @objc private func skipTapped() {
        navigateToAuth()
    }

    @objc private func nextTapped() {
        let currentPage = pageControl.currentPage
        if currentPage < slides.count - 1 {
            let nextPage = currentPage + 1
            let offset = CGPoint(x: view.frame.width * CGFloat(nextPage), y: 0)
            scrollView.setContentOffset(offset, animated: true)
        } else {
            navigateToAuth()
        }
    }

    private func navigateToAuth() {
        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)

        if pageIndex == CGFloat(slides.count - 1) {
            nextButton.setTitle("Get Started", for: .normal)
            skipButton.isHidden = true
        } else {
            nextButton.setTitle("Next", for: .normal)
            skipButton.isHidden = false
        }
    }
}
