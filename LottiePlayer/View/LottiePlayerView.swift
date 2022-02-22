//
//  LottiePlayerView.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 22/02/22.
//

import UIKit
import Lottie

class LottiePlayerView: UIView {
    let animationView: AnimationView = {
        let view = AnimationView(frame: .zero)
        view.loopMode = .loop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.addSubview(animationView)
        NSLayoutConstraint.activate([
            self.animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.animationView.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 20),
            self.animationView.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: 20),
            self.animationView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 100),
            self.animationView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 100)
        ])
    }
    
    func playAnimation(animation: Animation) {
        animationView.animation = animation
        animationView.play(completion: nil)
    }
}
