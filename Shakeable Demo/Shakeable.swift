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
    /// - Parameter totalDuration: The overall duration of the shake animation.
    /// - Parameter segmentDuration: duration for each segment of the animation
    /// - Parameter magnitude: a measure of how much the view should move from its center point
    func shake(for totalDuration: TimeInterval = 0.5, segmentDuration: TimeInterval = 0.1, magnitude: CGFloat = 5.0) {
        let animation = CABasicAnimation(keyPath: "position")

        // `animation.duration` (which is `segmentDuration`) defines the time for one part of the animation.
        // For example, moving from the original center to one side (e.g. center.x - magnitude).
        animation.duration = segmentDuration

        // `animation.repeatDuration` (which is `totalDuration`) controls the total time the shaking effect will last.
        // This is the total duration for all repeating cycles of the animation.
        animation.repeatDuration = totalDuration

        // `autoreverses = true` makes the animation play forwards and then backwards.
        // In this specific animation:
        // 1. It animates from `fromValue` (center.x - magnitude) to `toValue` (center.x + magnitude) in `segmentDuration`.
        // 2. Then, because `autoreverses` is true, it animates from `toValue` (center.x + magnitude) back to `fromValue` (center.x - magnitude) in another `segmentDuration`.
        // So, one full cycle (e.g., from left extreme, to right extreme, and back to left extreme) takes 2 * segmentDuration.
        animation.autoreverses = true

        // The animation starts from a position `magnitude` points to the left of the view's center.
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - magnitude, y: self.center.y))
        // The animation moves to a position `magnitude` points to the right of the view's center.
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + magnitude, y: self.center.y))

        layer.add(animation, forKey: "shake")
    }
}

