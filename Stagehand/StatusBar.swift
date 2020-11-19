//
//  StatusBar.swift
//  Stagehand
//
//  Created by Jordan Kay on 3/8/18.
//  Copyright © 2018 Cultivr. All rights reserved.
//

open class StatusBarAnimatingViewController: UIViewController {
    open var statusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    public var currentStatusBarStyle: UIStatusBarStyle? {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: UIViewController
    final override public var preferredStatusBarStyle: UIStatusBarStyle {
        return currentStatusBarStyle ?? statusBarStyle
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let coordinator = transitionCoordinator, let viewController = navigationController?.topViewController as? StatusBarAnimatingViewController, !coordinator.isCancelled else { return }
        viewController.currentStatusBarStyle = preferredStatusBarStyle
        coordinator.animate {
            viewController.currentStatusBarStyle = viewController.statusBarStyle
        }
    }
}

extension UINavigationController {
    // MARK: UIViewController
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
