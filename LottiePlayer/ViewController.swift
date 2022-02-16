//
//  ViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit

class ViewController: UIViewController {
    private let loadButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let urlField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Enter url here...."
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.returnKeyType = .continue
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        urlField.delegate = self
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(urlField)
        NSLayoutConstraint.activate([
            self.urlField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.urlField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.urlField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.view.addSubview(loadButton)
        NSLayoutConstraint.activate([
            self.loadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loadButton.topAnchor.constraint(equalTo: self.urlField.bottomAnchor, constant: 32),
            self.loadButton.heightAnchor.constraint(equalToConstant: 36),
            self.loadButton.widthAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func loadButtonTapped() {
        urlField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
}
