//
//  DLLoginViewC.swift
//  DianLiiCar
//
//  Created by 李典 on 16/12/18.
//  Copyright © 2016年 李典. All rights reserved.
//

import UIKit
import AVFoundation
import SVProgressHUD

class DLLoginViewC: DLBasePage {
    // 播放视频的变量
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    // 登录地址授权
    var location: DLLocation?
    
    // 注册页面
//    private lazy var registVc: DLRegistAccountVc? = DLRegistAccountVc()
    
    
    
    //  登录页面 背景图片
    @IBOutlet var backImageView: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 先调用视频
        startVideo()
        startAnimation()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "Login", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //播放动画
    func startAnimation() {
        var images:[UIImage]? = []
        var imageName: String?
        
        for i in 0 ... 67 {
            imageName = "logo-" + String(format: "%03d.png", i)
            if let name = imageName {
                images?.append(UIImage(named: name)!)
            }
        }
        backImageView.animationImages = images
        backImageView.animationDuration = 3
        backImageView.animationRepeatCount = 1
        backImageView.startAnimating()
        
        // 动画播放之后播放视频
        UIView.animate(withDuration: 0.7, delay: 3, options: .curveEaseOut, animations: {
            self.backView.alpha = 1.0
            self.player?.play()
        }) { (_) in
            print(message: "动画结束")
        }
        
    }
    // 播放视频
    func startVideo() {
        // 获取视频路径
        let path = Bundle.main.path(forResource: "welcome_video", ofType: "mp4")
        // 根据路径创建url
        let url = NSURL.fileURL(withPath: path!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player!)
        
        
        // 设置 播放器大小
        playerLayer.frame = backView.bounds
        //  视频等比例缩放
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        // 播放动画的时候 要隐藏
        backView.layer.insertSublayer(playerLayer, at: 0)
        backView.alpha = 0
        
        // 循环播放的通知
        NotificationCenter.default.addObserver(self, selector: #selector(finishVideo(noti:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    // 循环播放动画的实现
    func finishVideo(noti: Notification) {
        //
        let item = noti.object as! AVPlayerItem
        
        item.seek(to: kCMTimeZero)
        
        self.player?.play()
 
    }
    
    
    
    
    // 登录按钮
    @IBAction func loginButton(_ sender: UIButton) {
        print("登录")
        location = DLLocation()
        location?.startLocation()
    }
    
    // 注册按钮
    @IBAction func registButton(_ sender: UIButton) {
        print("注册")
//        SVProgressHUD.showSuccess(withStatus: "注册")
//        SVProgressHUD.showProgress(100)
//        SVProgressHUD.showProgress(100, status: "注册")
//        SVProgressHUD.show()
        let registVc = DLRegistAccountVc()
        SVProgressHUD.show(withStatus: "注册")
        let nav = UINavigationController(rootViewController: registVc);
//        self.present(nav, animated: true, completion: nil);
        self.present(nav, animated: true) {
            SVProgressHUD.dismiss()
        }
    }
}
