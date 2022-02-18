//
//  URLInputView.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 18/02/22.
//

import Foundation
import UIKit

protocol URLInputViewDelegate: AnyObject {
    func didTapLoadButton(input : String?)
}

class URLInputView: UIView {
    private let loadButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
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
    
    weak var delegate: URLInputViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        urlField.delegate = self
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        
        self.addSubview(urlField)
        NSLayoutConstraint.activate([
            self.urlField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.urlField.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.urlField.widthAnchor.constraint(equalToConstant: 200),
            self.urlField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.addSubview(loadButton)
        NSLayoutConstraint.activate([
            self.loadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loadButton.topAnchor.constraint(equalTo: self.urlField.bottomAnchor, constant: 32),
            self.loadButton.heightAnchor.constraint(equalToConstant: 30),
            self.loadButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        self.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            self.errorLabel.topAnchor.constraint(equalTo: self.loadButton.bottomAnchor, constant: 32),
            self.errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(spinner)
        NSLayoutConstraint.activate([
            self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    @objc private func loadButtonTapped() {
        urlField.resignFirstResponder()
        delegate?.didTapLoadButton(input: urlField.text)
    }
    
    func startLoading() {
        self.spinner.startAnimating()
    }
    
    func stopLoading() {
        self.spinner.stopAnimating()
    }
    
    func showError() {
        self.errorLabel.isHidden = false
    }
}

extension URLInputView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.errorLabel.isHidden = true
        self.spinner.stopAnimating()
    }
}
