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
        // addBtnを設置
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
  
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem) {
        switch genre {
        case "OthersWhole":
            (self.viewControllers![0] as? OthersWholeViewController)?.getImage()
        case "WanpiWhole":
            (self.viewControllers![0] as? WanpiWholeViewController)?.getImage()
        case "OthersWhole":
            (self.viewControllers![0] as? OthersWholeViewController)?.getImage()
        case "OthersWhole":
            (self.viewControllers![0] as? OthersWholeViewController)?.getImage()
        case "OthersWhole":
            (self.viewControllers![0] as? OthersWholeViewController)?.getImage()
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


