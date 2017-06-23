
//  DLLocation.swift
//  DianLiiCar
//
//  Created by 李典 on 16/12/20.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit
import CoreLocation
class DLLocation: NSObject {
    var locationManager: CLLocationManager!
    var currLocation : CLLocation!
    
    func startLocation() {
        // 判断 服务是否存在
        //初始化位置管理器
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //设备使用电池供电时最高的精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //精确到1000米,距离过滤器，定义了设备移动后获得位置信息的最小距离
        locationManager.distanceFilter = 100
        if ios8() {
            //如果是IOS8及以上版本需调用这个方法
            locationManager.requestAlwaysAuthorization()
            //使用应用程序期间允许访问位置数据
            locationManager.requestWhenInUseAuthorization();
            //启动定位
            locationManager.startUpdatingLocation()
        }
    }
    func ios8() -> Bool {
        let versionCode:String = UIDevice.current.systemVersion
        let version = NSString(string:  versionCode).doubleValue
        return version >= 8.0
    }
    
    
    
}
extension DLLocation: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    // 搜索地址
    func searchAddress(location: CLLocation) {
        
        let coder = CLGeocoder()
        var p:CLPlacemark?
        
        coder.reverseGeocodeLocation(currLocation, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print("获取地址失败: \(error!.localizedDescription)")
                return
            }
            let pm = placemarks! as [CLPlacemark]
            if (pm.count > 0){
                p = placemarks![0] as CLPlacemark
                print("地址:\(p!.name!)")
            }else{
                print("没地址!")
            }
        })
    }
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.count-1] as CLLocation
        currLocation=location
        if (location.horizontalAccuracy > 0) {
            self.locationManager.stopUpdatingLocation()
            print("wgs84坐标系  纬度: \(location.coordinate.latitude) 经度: \(location.coordinate.longitude)")
            self.locationManager.stopUpdatingLocation()
            print("结束定位")
        }
        searchAddress(location: currLocation)
        //
        //        //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
        manager.stopUpdatingLocation()
    }
}
