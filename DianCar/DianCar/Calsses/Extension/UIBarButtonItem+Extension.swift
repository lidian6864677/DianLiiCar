//
//  UIBarButtonItem+Extension.swift
//  DianLii - 微博
//
//  Created by 李典 on 16/11/30.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(title: String, imageName: String? = nil, target: Any?, action: Selector) {
        
        self.init()
        let button = UIButton()
//        文字
        button.setTitle(title, for: .normal)
//        颜色
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        
        if imageName != nil {
            button.setImage(UIImage(named: imageName!), for: .normal)
        }
        
        
//        字体大小
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        点击事件
        button.addTarget(target, action: action, for: .touchUpInside)
        button.sizeToFit()
        
        // 关联
        self.customView = button
    }
    
}
