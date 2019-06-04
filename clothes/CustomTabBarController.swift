//
//  CustomTabBarController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/05/28.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//
import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.tabBar.frame = CGRect(x: 0.0, y: 80.0, width: screenWidth, height: screenHeight * 0.1)
            
    }
}
