//
//  BaseViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/4.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    private var bag = DisposeBag()
    //屏幕截图
    public var snapShotView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backButton)
        backButton.isHidden = hidesBackButton
//        backButton.snp.makeConstraints { (btn) in
//            btn.size.equalTo(CGSize(width: 45, height: 30))
//        }

        backButton.rx.tap.bind {
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: bag)
    }
    
    public var hidesTabBarWhenPushed: Bool = false
    public var hidesBackButton: Bool = true {
        didSet {
            backButton.isHidden = hidesBackButton
        }
    }

    /// 返回按钮
    public let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "icon_back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
}
