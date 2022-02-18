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
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
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
            self.animationView.rightAnchor.constraint(lessThanOrEqualTo: self.view.rightAnchor, constant: 20),
            self.animationView.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 100),
            self.animationView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: 100)
        ])
    }
    
    func playAnimation(animation: Animation) {
        animationView.animation = animation
        animationView.play(completion: nil)
    }
}
