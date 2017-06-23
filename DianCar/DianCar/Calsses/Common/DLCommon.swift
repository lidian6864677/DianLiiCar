//
//  DLCommon.swift
//  DianLiiCar
//
//  Created by 李典 on 16/12/18.
//  Copyright © 2016年 李典. All rights reserved.
//
// 公共定义
import Foundation
import UIKit

let screenHeight = UIScreen.main.bounds.width
// 正在加载的宏
let loding = "加载中..."




// 判断版本输出日志
func print(message: String, function: String = #function) {
    
    #if DEBUG
        print("Log:\(message),\(function)")
    #else
        
    #endif
}
// 判断是否是Iphone6 或 7
func isIphone6Or7() -> Bool {
    if screenHeight == 667 {
        return true
    }
    
    return false
    
}
// 判断是否是Iphone6P 或 7P
func isIphone6pOr7p() -> Bool {
    if screenHeight == 736 {
        return true
    }
    return false
}
