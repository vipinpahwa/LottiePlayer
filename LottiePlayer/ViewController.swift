//
//  ViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private let loadButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        return button
    }()
    
    private let urlField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Enter url here...."
        textField.clearButtonMode = .always
        textField.keyboardType = .URL
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.returnKeyType = .continue
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Failed to load animation. Try with a different url."
        label.textColor = .red
        label.isHidden = true
        label.isUserInteractionEnabled = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    private var lottieManager = LottieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieManager.delegate = self
        urlField.delegate = self
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(urlField)
        NSLayoutConstraint.activate([
            self.urlField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.urlField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.urlField.widthAnchor.constraint(equalToConstant: 200),
            self.urlField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.view.addSubview(loadButton)
        NSLayoutConstraint.activate([
            self.loadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loadButton.topAnchor.constraint(equalTo: self.urlField.bottomAnchor, constant: 32),
            self.loadButton.heightAnchor.constraint(equalToConstant: 30),
            self.loadButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        self.view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            self.errorLabel.topAnchor.constraint(equalTo: self.loadButton.bottomAnchor, constant: 32),
            self.errorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(spinner)
        NSLayoutConstraint.activate([
            self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func loadButtonTapped() {
        urlField.resignFirstResponder()
        spinner.startAnimating()
        if let url = urlField.text {
            lottieManager.loadAnimation(url: url)
        }
    }
}

extension ViewController: LottieManagerDelegate {
    func didLoadAnimation(animation: Animation) {
        spinner.stopAnimating()
        let vc = LottieViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: false)
        vc.playAnimation(animation: animation)
        print("didLoadAnimation")
    }
    
    func didFailLoadingAnimation() {
        spinner.stopAnimating()
        errorLabel.isHidden = false
        print("didFailLoadingAnimation")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.errorLabel.isHidden = true
    }
}
