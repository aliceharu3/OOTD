//
//  ClothesCollectionViewCell.swift
//  clothes
//
//  Created by Haru Ichiue on 2018/11/27.
//  Copyright © 2018年 Haru Ichiue. All rights reserved.
//

import UIKit

class ClothesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showImage(image: UIImage) ->Void {
        imageView.image = image
    }
   
}
