//
//  CategoryManager.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/5.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController {
    func showNextController(className: String, isPush: Bool) {
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
        let className = clsName! + "." + className
        let controllerName = NSClassFromString(className) as! UIViewController.Type
        let controller = controllerName.init()
        if isPush {
            // 暂时在这里隐藏，后面放到导航扩展里面
            self.navigationController?.pushViewController(controller, animated: true)
            controller.tabBarController?.hidesBottomBarWhenPushed = true
        } else {
            self.present(controller, animated: true, completion: nil)
        }
       
    }
    
//    func setParames(parames: [Dictionary]) {
//
//    }
}
