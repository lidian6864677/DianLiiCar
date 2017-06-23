//
//  NSString + Extension.swift
//  DianCar
//
//  Created by 李典 on 16/12/23.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit


extension String {
    
//    class StringOfCutOffFirstLetter: NSString {
//        <#code#>
//    }
    static func StringOfCutOffFirstLetter(aStr: String) -> String {
        //转成了可变字符串
//        NSMutableString *str = [NSMutableString stringWithString:aString];
        let str = NSMutableString(string: aStr as String)
        //先转换为带声调的拼音
//        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
        CFStringTransform(str, nil, kCFStringTransformMandarinLatin, false)
        //再转换为不带声调的拼音
//        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
        CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false)
        //转化为大写拼音
//        NSString *pinYin = [str capitalizedString];
        let pinYin = str.capitalized
        
        //获取并返回首字母
//        return [pinYin substringToIndex:1];
        let index = "a".endIndex
        
        
        return pinYin.substring(to: index) as String
        
    }
    
    
    
    
    
    
    
}
