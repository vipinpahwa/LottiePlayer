//
//  LottieManager.swift
//  LottiePlayer
//
//  Created by Vipin Pahwa on 16/02/22.
//

import Foundation

protocol LottieManagerDelegate {
    func didLoadAnimation()
    func didFailWithError()
}

struct LottieManager {
    var delegate: LottieManagerDelegate?
}
