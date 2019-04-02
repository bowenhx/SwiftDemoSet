//
//  BaseContainerViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2019/3/29.
//  Copyright © 2019 com.professional.cn. All rights reserved.
//

import UIKit

class BaseContainerViewController: BaseViewController {
    var subViewController: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = subViewController.title ?? ""
        
        view.backgroundColor = UIColor.white
        
        //添加控制器
        self.addChild(subViewController)
        //添加视图
        view.addSubview(subViewController.view)
        subViewController.view.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.bottom.equalToSuperview()
            }
        }
    }
    
    init(vc: UIViewController) {
        self.subViewController = vc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
