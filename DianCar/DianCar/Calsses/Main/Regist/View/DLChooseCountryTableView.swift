//
//  DLChooseCountryTableView.swift
//  DianCar
//
//  Created by 李典 on 16/12/23.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit
import YYModel


private let ChooseCountryTableViewIdentifier = "DLChooseCountryTableViewIdentifier"
class DLChooseCountryTableView: UITableViewController {

    // 所有国家的数据   存储国家code 和名字
    var coutryModelList: [DLCountryModel] = []
    // 所有国家的首字母   存储国家首字母
    var headers: [String] = []
    // 首字母和国家数据组合  存储国家数据数组  和  首字母  字典
    var coutryAllList: [String: Any] = [:]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadCountry()
        loadGroupCountry()
    }
    
    
    // MARK: -  设置UI界面
    private func setupUI() {
        // 注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ChooseCountryTableViewIdentifier)
        // 设置 nav navigationItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", imageName: nil, target: self, action: #selector(cancleButtonAction))
    }
    
    //MARK: - 获取国家名称
    private func loadCountry() {
        // 获取国家的code 编码  例如 中国CN ？ 所有国家的数组 !!!  不要写错！！
        let countryCodeArray = NSLocale.isoCountryCodes
        // 获取当前的locale  地点
          let locale:NSLocale = NSLocale.current as NSLocale
        
        
        // 遍历 国家code和名字这个数组
        for code in countryCodeArray {
//            创建一个模型
            let countryModel = DLCountryModel()
            //  赋值 code
            countryModel.code = code
            // 赋值name
            countryModel.name = locale.displayName(forKey: NSLocale.Key.countryCode, value: code)
            //            print(code)
            //            print(countryModel.name ?? "没找到")
//            将模型放入数组中
            coutryModelList.append(countryModel)
        
        }
        
        // 排序
        coutryModelList.sort(by: { (a: DLCountryModel, b: DLCountryModel) -> Bool in
            return a.name!.localizedCaseInsensitiveCompare(b.name!) == .orderedAscending
        })
        
     }
    //MARK: - load CountryModel 分组
    private func loadGroupCountry() {
        // 首字母
        var firstLetter: String?
        // modelList数据
        
        //         创建一个 存储 首字母
        var array: [String] = []
        // 创建 一个数组存储  国家的名字和code的模型
        var countrName: [DLCountryModel] = []
        // 遍历 国家的名字和code数组
        for country in coutryModelList {
            
            
//            print(country.name!)
//            firstLetter = country.name?.substring(to: 0)
//            print(firstLetter)
            // 获取名字  处理  返回一个手字谜
            firstLetter = String.StringOfCutOffFirstLetter(aStr: country.name!)
            // 如果数组中不包含 本次遍历的字母
            if !array.contains(firstLetter!) {
            // 不包含
                // 如果 国家的名字和code的模型 大于0
                if countrName.count > 0 {
                    // 将其添加早字典中
                     coutryAllList[headers.last!] = countrName
                }
                //  字母添加到 首字母数组中
                array.append(firstLetter!)
                //  清空模型数组
                countrName = []
            }
            //  将遍历出来每一个首字母相同的数组放入数组模型中
            countrName.append(country)
            headers = array
        }
        // 因为最后一个 不会进入循环  所以在加一次
         coutryAllList[headers.last!] = countrName
    }
    
    
    
    
    // MARK: - 点击事件
        // 取消按钮点击事件
    @objc private func cancleButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    // 组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    // 每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = headers[section]
        let datas = coutryAllList[key] as! [DLCountryModel]
        return datas.count
    }
    //cell 的值
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseCountryTableViewIdentifier, for: indexPath)
        //  根据 首字母取出字典的key
        let key = headers[indexPath.section]
        //  根据可以取出字典中的模型
        let datas = coutryAllList[key] as! [DLCountryModel]
        cell.textLabel?.text = datas[indexPath.row].name
        cell.imageView?.image = UIImage(named: datas[indexPath.row].code!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return headers
    }
    //cell点击事件
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = headers[indexPath.section]
        let datas = coutryAllList[key] as! [DLCountryModel]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ChooseCountryTableNotification), object: datas[indexPath.row].code)
    }
    


}
