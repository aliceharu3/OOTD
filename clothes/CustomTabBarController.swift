//
//  CustomTabBarController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/05/28.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//
import UIKit

class CustomTabBarController: UITabBarController {
    
    // ボタンを用意
    var addBtn: UIBarButtonItem!
    var genre = "hoge"
    var viewControllerArray:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ナビゲーションバーを作る
        let navBar = UINavigationBar()
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        //xとyで位置を、widthとheightで幅と高さを指定する
        navBar.frame = CGRect(x: 0, y: screenHeight * 0.05, width: screenWidth, height: screenHeight)
        
        //ナビゲーションアイテムのタイトルを設定
        let navItem : UINavigationItem = UINavigationItem(title: "一覧")
        
        //ナビゲーションバー右のボタンを設定
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped(_:)))
        
        //ナビゲーションバーにアイテムを追加
        navBar.pushItem(navItem, animated: true)
        
        //Viewにナビゲーションバーを追加
        self.view.addSubview(navBar)
        
    }
    
  
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem) {
        switch genre {
        case "OthersWhole":
            (self.viewControllers![0] as? OthersWholeViewController)?.getImage()
        case "WanpiWhole":
            (self.viewControllers![1] as? WanpiWholeViewController)?.getImage()
        case "AkuseWhole":
            (self.viewControllers![2] as? AkuseWholeViewController)?.getImage()
        case "TopsWhole":
            (self.viewControllers![3] as? TopsWholeViewController)?.getImage()
        case "BottomsWhole":
            (self.viewControllers![4] as? BottomsWholeViewController)?.getImage()
        default:
            print("Error")
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.tabBar.frame = CGRect(x: 0.0, y: 80.0, width: screenWidth, height: screenHeight * 0.1)
        
    }
}


