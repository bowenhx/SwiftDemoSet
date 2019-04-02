//
//  NavigationAnimation.swift
//  SwiftDemoSet
//
//  Created by ligb on 2019/3/29.
//  Copyright © 2019 com.professional.cn. All rights reserved.
//

import UIKit
import SwifterSwift

class BNavigationAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let operation: UINavigationController.Operation
    
    init(operation: UINavigationController.Operation) {
        self.operation = operation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch operation {
        case .push:
            self.pushAnimation(context: transitionContext)
        case .pop:
            self.popAnimation(context: transitionContext)
        default:
            break
        }
    }
    
    // MARK: - Animation Method
    private func pushAnimation(context: UIViewControllerContextTransitioning) {
        /*切出和切入的VC*/
        let fromVC = context.viewController(forKey: .from)
        let toView = context.view(forKey: .to)!
        let toVC = context.viewController(forKey: .to)
        
        /*VC切换所发生的view容器，开发者应该将切出的view移除，将切入的view加入到该view容器中。*/
        let containerView = context.containerView
        let tabBarVC = fromVC?.parent?.parent as! BTabBarViewController
        
        //截图
        let snapShotView = tabBarVC.view!.snapshotView(afterScreenUpdates: false)!
        (fromVC as! BaseViewController).snapShotView = snapShotView
        
        //隐藏Tabbar
        if let toVC = toVC as? BaseViewController {
            tabBarVC.tabBar.isHidden = toVC.hidesTabBarWhenPushed
        }
        
        //黑色背景
        let blackView = UIView(frame: containerView.bounds)
        blackView.backgroundColor = UIColor.black
        containerView.addSubview(blackView)
        containerView.addSubview(snapShotView)
        containerView.addSubview(toView)
        
        toView.frame = CGRect(x: toView.width, y: 0, width: toView.width, height: toView.height)
        UIView.animate(withDuration: self.transitionDuration(using: context), delay: 0, options: .curveEaseInOut, animations: {
            snapShotView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            toView.frame = CGRect(x: 0, y: 0, width: toView.width, height: toView.height)
        }) { (finished) in
            snapShotView.removeFromSuperview()
            blackView.removeFromSuperview()
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
    
    private func popAnimation(context: UIViewControllerContextTransitioning) {
        let fromVC = context.viewController(forKey: .from)!
        let fromView = context.view(forKey: .from)!
        let toView = context.view(forKey: .to)!
        let toVC = context.viewController(forKey: .to)
        let containerView = context.containerView
        let tabBarVC = toVC?.parent?.parent as! BTabBarViewController
        
        tabBarVC.tabBar.isHidden = true
        containerView.addSubview(toView)
        
        //黑色背景
        let blackView = UIView(frame: CGRect(x: 0, y: 0, width: containerView.width, height: containerView.height))
        blackView.backgroundColor = UIColor.black
        containerView.addSubview(blackView)
        
        let snapShotView = (toVC as! BaseViewController).snapShotView
        if let snapShotView = snapShotView {
            containerView.addSubview(snapShotView)
            snapShotView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        
        containerView.addSubview(fromView)
        
        UIView.animate(withDuration: self.transitionDuration(using: context), delay: 0, options: .curveEaseInOut, animations: {
            if let snapShotView = snapShotView {
                snapShotView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            fromView.frame = CGRect(x: containerView.width, y: 0, width: fromView.width, height: fromView.height)
        }) { (finished) in
            if let snapShotView = snapShotView {
                snapShotView.removeFromSuperview()
            }
            blackView.removeFromSuperview()
            tabBarVC.tabBar.isHidden = context.transitionWasCancelled ?
                (fromVC as! BaseViewController).hidesTabBarWhenPushed :
                (toVC as! BaseViewController).hidesTabBarWhenPushed
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
}

