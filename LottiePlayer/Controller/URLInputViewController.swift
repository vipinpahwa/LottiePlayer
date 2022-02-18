//
//  URLInputViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit
import Lottie

class URLInputViewController: UIViewController {
    private let urlInputView = URLInputView(frame: .zero)
    private var lottieManager = LottieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieManager.delegate = self
        urlInputView.delegate = self
        urlInputView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(urlInputView)
        NSLayoutConstraint.activate([
            urlInputView.topAnchor.constraint(equalTo: self.view.topAnchor),
            urlInputView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            urlInputView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            urlInputView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}

extension URLInputViewController: LottieManagerDelegate {
    func didLoadAnimation(animation: Animation) {
        urlInputView.stopLoading()
        let vc = LottieViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        vc.playAnimation(animation: animation)
        print("didLoadAnimation")
    }
    
    func didFailLoadingAnimation() {
        urlInputView.stopLoading()
        urlInputView.showError()
        print("didFailLoadingAnimation")
    }
}

extension URLInputViewController: URLInputViewDelegate {
    func didTapLoadButton(input: String?) {
        guard let input = input,
              let url = URL(string: input) else {
                  urlInputView.showError()
                  return
              }
        urlInputView.startLoading()
        lottieManager.loadAnimation(url: url)
    }
}
