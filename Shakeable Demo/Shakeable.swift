//
//  Shakeable.swift
//  Shakeable Demo
//
//  Created by Marius Fanu on 11/3/17.
//  Copyright © 2017 Marius Fanu. All rights reserved.
//

import UIKit


protocol Shakeable {
    func shake(for duration: TimeInterval)
}

extension Shakeable where Self: UIView {

    /// Shakes the view for the given duration
    ///
    /// - Parameter duration: duration for the animation
    func shake(for duration: TimeInterval = 0.5) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatDuration = duration
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
}

