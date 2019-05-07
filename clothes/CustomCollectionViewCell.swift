//
//  CustomCollectionViewCell.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/22.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
