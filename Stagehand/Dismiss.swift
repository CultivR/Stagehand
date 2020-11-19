//
//  Dismiss.swift
//  Stagehand
//
//  Created by Jordan Kay on 3/8/18.
//  Copyright © 2018 Cultivr. All rights reserved.
//

public extension UIViewController {
    func dismiss(completion: @escaping () -> Void) {
        dismiss(delayedCompletion: false, completion: completion)
    }
    
    func dismiss(delayedCompletion: Bool, completion: @escaping () -> Void) {
        view.endEditing(true)
        if let presentingViewController = presentingViewController {
            presentingViewController.dismiss(animated: true) {
                if delayedCompletion {
                    DispatchQueue.main.async(execute: completion)
                } else {
                    completion()
                }
            }
        } else if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
