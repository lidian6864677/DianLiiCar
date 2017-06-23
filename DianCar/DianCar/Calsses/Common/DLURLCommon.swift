//
//  DLURLCommon.swift
//  DianLiiCar
//
//  Created by 李典 on 16/12/18.
//  Copyright © 2016年 李典. All rights reserved.
//

import Foundation


// 发布的时候的地址    
func appStoreAdd() -> String {
    var add = "192.168.0.0.1"
    #if AppStore
     add = "www.baidu.com"
    #endif
    return add
}
