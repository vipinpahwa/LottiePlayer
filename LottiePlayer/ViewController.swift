//
//  ViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit

class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Lottie Player"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let urlField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Enter url here...."
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
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.view.addSubview(urlField)
        NSLayoutConstraint.activate([
            self.urlField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.urlField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.urlField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
}
