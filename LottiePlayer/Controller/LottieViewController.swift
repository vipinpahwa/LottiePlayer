//
//  LottieViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    private let lottiePlayerView = LottiePlayerView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        lottiePlayerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lottiePlayerView)
        NSLayoutConstraint.activate([
            lottiePlayerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            lottiePlayerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            lottiePlayerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            lottiePlayerView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    func playAnimation(animation: Animation) {
        lottiePlayerView.playAnimation(animation: animation)
    }
}
