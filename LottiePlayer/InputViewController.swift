//
//  ViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit
import Lottie

class InputViewController: UIViewController {
    private let iView = InputView(frame: .zero)
    private var lottieManager = LottieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieManager.delegate = self
        iView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iView)
        NSLayoutConstraint.activate([
            iView.topAnchor.constraint(equalTo: self.view.topAnchor),
            iView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            iView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            iView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}

extension InputViewController: LottieManagerDelegate {
    func didLoadAnimation(animation: Animation) {
        iView.stopLoading()
        let vc = LottieViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        vc.playAnimation(animation: animation)
        print("didLoadAnimation")
    }
    
    func didFailLoadingAnimation() {
        iView.stopLoading()
        print("didFailLoadingAnimation")
    }
}
