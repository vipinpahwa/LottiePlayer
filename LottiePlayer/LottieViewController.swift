//
//  LottieViewController.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    let animationView: AnimationView = {
        let view = AnimationView(frame: .zero)
        view.loopMode = .loop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(animationView)
        NSLayoutConstraint.activate([
            self.animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.animationView.leftAnchor.constraint(greaterThanOrEqualTo: self.view.leftAnchor, constant: 20),
            self.animationView.rightAnchor.constraint(lessThanOrEqualTo: self.view.rightAnchor, constant: 10)
        ])
    }
    
    func playAnimation(animation: Animation) {
        animationView.animation = animation
        animationView.play(completion: nil)
    }
}
