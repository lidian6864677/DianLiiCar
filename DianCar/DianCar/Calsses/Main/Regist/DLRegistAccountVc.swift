//
//  DLRegistAccountVc.swift
//  DianLiiCar
//
//  Created by 李典 on 16/12/21.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit
import SnapKit

class DLRegistAccountVc: UIViewController {
    
    @IBOutlet weak var accountView: UIView!
    //
    @IBOutlet weak var chooseCountryButton: UIButton!
    //    private lazy var registV: registView = registView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMotification()
        setupUI()
        setupNav()
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "registView", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    private func setupUI() {
        
        
        
        // View 切圆角
        accountView.layer.cornerRadius = 10
        accountView.layer.masksToBounds = true
    }
    
    // 设置 导航栏
    func setupNav() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一步", imageName: nil, target: self, action: #selector(nextButtonAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", imageName: nil, target: self, action: #selector(cancelButtonAction))
        
        //        self.navigationItem.prompt = "" // 这个是导航栏的副标题
        self.navigationItem.title = "创建用户"
    }
    // MARK: - nav点击事件
    @objc private func nextButtonAction() {
        print("下一步")
        
        
    }
    //MARK: - 通知接收
    private func addMotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(chooseCountryAction(noti:)), name: NSNotification.Name(rawValue: ChooseCountryTableNotification), object: nil)
        
    }
    // MARK: - 接收通知实现的方法
    @objc private func chooseCountryAction(noti: Notification) {
        let image = UIImage(named: noti.object as! String)
        
        self.chooseCountryButton.setBackgroundImage(image, for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: -  点击国家按钮 
    @IBAction func chooseCountry(_ sender: UIButton) {
        // 点击 国家按钮跳转的到 选择国家的页面
        let chooseCountry = DLChooseCountryTableView()
        let nav = UINavigationController(rootViewController: chooseCountry)
        self.present(nav, animated: true, completion: nil);
        
    }
    @objc private func cancelButtonAction() {
        print("取消")
//        跳转回  登录界面
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
