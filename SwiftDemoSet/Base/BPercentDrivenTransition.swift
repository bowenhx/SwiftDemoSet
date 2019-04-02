//
//  BPercentDrivenTransition.swift
//  SwiftDemoSet
//
//  Created by ligb on 2019/3/29.
//  Copyright © 2019 com.professional.cn. All rights reserved.
//

import UIKit
import SwifterSwift

class BPercentDrivenTransition: UIPercentDrivenInteractiveTransition {
    var isStart: Bool = false
    
    @IBOutlet private weak var controller: UINavigationController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let controller = controller {
            self.addGenstureFor(controller: controller)
        }
    }
    
    func addGenstureFor(controller: UIViewController) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(gensture:)))
        controller.view.addGestureRecognizer(pan)
    }
    
    @objc func pan(gensture: UIPanGestureRecognizer) {
        controller?.view.endEditing(true)
        
        let currentPoint = gensture.translation(in: gensture.view)
        var progress = currentPoint.x / gensture.view!.width
        
        progress = min(1, max(progress, 0))
        
        if gensture.state == .began {
            isStart = true
            controller?.popViewController(animated: true)
        } else if gensture.state == .changed {
            self.update(progress)
        } else if gensture.state == .ended || gensture.state == .cancelled {
            isStart = false
            if progress > 0.3 {
                self.finish()
            } else {
                self.cancel()
            }
        }
    }
}

