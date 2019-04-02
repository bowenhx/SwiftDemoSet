//
//  BaseNavigationViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/20.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        var toVC = viewController
        if let showVC = toVC as? BaseViewController {
            if self.children.count > 0 {
                showVC.hidesBackButton = false
                showVC.hidesTabBarWhenPushed = true
            }
        } else {
            toVC = BaseContainerViewController(vc: viewController)
            let showVC = toVC as! BaseViewController
            if children.count > 0 {
                showVC.hidesBackButton = false
                showVC.hidesTabBarWhenPushed = true
            }
        }
        super.pushViewController(toVC, animated: animated)
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated)
    }

}
