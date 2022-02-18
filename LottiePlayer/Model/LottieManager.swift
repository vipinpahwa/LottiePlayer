//
//  LottieManager.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import Foundation
import Lottie

protocol LottieManagerDelegate {
    func didLoadAnimation(animation: Animation)
    func didFailLoadingAnimation()
}

struct LottieManager {
    var delegate: LottieManagerDelegate?
    
    func loadAnimation(url: URL) {
        Animation.loadedFrom(url: url, closure: { animation in
            if let animation = animation {
                delegate?.didLoadAnimation(animation: animation)
            } else {
                delegate?.didFailLoadingAnimation()
            }
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}
