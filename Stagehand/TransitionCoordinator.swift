//
//  TransitionCoordinator.swift
//  Stagehand
//
//  Created by Jordan Kay on 3/8/18.
//  Copyright © 2018 Cultivr. All rights reserved.
//

extension UIViewControllerTransitionCoordinator {
    func animate(animations: @escaping () -> Void) {
        if isInteractive {
            animate(alongsideTransition: { _ in
                animations()
            }, completion: nil)
        } else {
            let curve = UInt(completionCurve.rawValue)
            let options = UIView.AnimationOptions(rawValue: curve << 16)
            UIView.animate(withDuration: transitionDuration, delay: 0, options: options, animations: animations, completion: nil)
        }
    }
}
