  //
  //  UIView + Extension.swift
  //  DianLii - 微博
  //
  //  Created by 李典 on 16/11/30.
  //  Copyright © 2016年 李典. All rights reserved.
  //
  
  import UIKit
  
  extension UIView{
    
    //    x轴坐标
    var x: CGFloat {
        get{
            return self.frame.origin.x
        }set{
            self.frame.origin.x = newValue
        }
    }
    //    y轴坐标
    var y: CGFloat {
        get{
            return self.frame.origin.y
        }set{
            self.frame.origin.y = newValue
        }
    }
    //    宽度
    var width: CGFloat {
        get{
            return self.frame.size.width
        }set{
            self.frame.size.width = newValue
        }
    }
    //    高度
    var height: CGFloat {
        get{
            return self.frame.size.height
        }set{
            self.frame.size.height = newValue
        }
    }
    //    size大小
    var size: CGSize {
        get{
            return self.frame.size
        }set{
            self.frame.size = newValue
        }
    }
    //    中心X
    var centerX: CGFloat {
        get{
            return self.center.x
        }set{
            self.center.x = newValue
        }
    }
    //    中心Y
    var centerY: CGFloat {
        get{
            return self.center.y
        }set{
            self.center.y = newValue
        }
    }
    //    屏幕宽
    var screenWidth: CGFont {
        get{
            return UIScreen.main.bounds.width as! CGFont
        }set{
            
        }
    }
    //    屏幕宽
    var screenHeight: CGFont {
        get{
            return UIScreen.main.bounds.height as! CGFont
        }set{
            
        }
    }
    
    
    
    
  }
  
