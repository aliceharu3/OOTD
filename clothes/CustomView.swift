//
//  CustomView.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/22.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit

class CustomView: UIView {

    
    override func draw(_ rect: CGRect) {
        // UIImageView インスタンス生成
        let rect:CGRect = CGRect(x:0, y:0, width:100, height:200)
        let imageView = UIImageView(frame:rect)
        self.addSubview(imageView)
    }
    

}
