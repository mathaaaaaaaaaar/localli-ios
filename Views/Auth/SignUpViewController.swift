//
//  SignUpViewController.swift
//  localli-ios
//
//  Created by Shaik Mathar Syed on 06/12/25.
//

// ==========================================
// S02: SIGNUP SCREEN
// ==========================================

import UIKit

class SignupViewController: UIViewController {

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
        lbl.text = "Create Account"
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm Password"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let roleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "I am a:"
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let customerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Customer", for: .normal)
        btn.backgroundColor = .systemBlue.withAlphaComponent(0.1)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let businessButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Business Owner", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.setTitleColor(.label, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.systemGray4.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let signupButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private var selectedRole: String = "customer"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sign Up"
        setupViews()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(titleLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(confirmPasswordTextField)
        contentView.addSubview(roleLabel)
        contentView.addSubview(customerButton)
        contentView.addSubview(businessButton)
        contentView.addSubview(signupButton)

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

            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),

            roleLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 24),
            roleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            customerButton.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 12),
            customerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customerButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.44),
            customerButton.heightAnchor.constraint(equalToConstant: 50),

            businessButton.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 12),
            businessButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            businessButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.44),
            businessButton.heightAnchor.constraint(equalToConstant: 50),

            signupButton.topAnchor.constraint(equalTo: customerButton.bottomAnchor, constant: 30),
            signupButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            signupButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])

        customerButton.addTarget(self, action: #selector(customerTapped), for: .touchUpInside)
        businessButton.addTarget(self, action: #selector(businessTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    }

    @objc private func customerTapped() {
        selectedRole = "customer"
        updateRoleSelection()
    }

    @objc private func businessTapped() {
        selectedRole = "business"
        updateRoleSelection()
    }

    private func updateRoleSelection() {
        if selectedRole == "customer" {
            customerButton.backgroundColor = .systemBlue.withAlphaComponent(0.1)
            customerButton.layer.borderColor = UIColor.systemBlue.cgColor
            customerButton.layer.borderWidth = 2

            businessButton.backgroundColor = .systemGray6
            businessButton.layer.borderColor = UIColor.systemGray4.cgColor
            businessButton.layer.borderWidth = 1
        } else {
            businessButton.backgroundColor = .systemBlue.withAlphaComponent(0.1)
            businessButton.layer.borderColor = UIColor.systemBlue.cgColor
            businessButton.layer.borderWidth = 2

            customerButton.backgroundColor = .systemGray6
            customerButton.layer.borderColor = UIColor.systemGray4.cgColor
            customerButton.layer.borderWidth = 1
        }
    }

    @objc private func signupTapped() {
        // TODO: Implement Firebase signup
        print("Sign up as \(selectedRole)")
        // Navigate based on selected role
        if selectedRole == "customer" {
            let customerDashboard = CustomerDashboardViewController()
            let navController = UINavigationController(rootViewController: customerDashboard)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true)
        } else {
//            let businessDashboard = BusinessDashboardViewController()
//            let navController = UINavigationController(rootViewController: businessDashboard)
//            navController.modalPresentationStyle = .fullScreen
//            present(navController, animated: true)
        }

    }
}
