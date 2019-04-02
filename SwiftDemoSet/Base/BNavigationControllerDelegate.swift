//
//  BNavigationControllerDelegate.swift
//  SwiftDemoSet
//
//  Created by ligb on 2019/3/29.
//  Copyright © 2019 com.professional.cn. All rights reserved.
//

import UIKit

class BNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
   
    @IBOutlet public var percent: BPercentDrivenTransition?
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BNavigationAnimation(operation: operation)
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController.isKind(of: BNavigationAnimation.self) {
            if let isStart = self.percent?.isStart {
                return isStart ? self.percent : nil
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
}
