//
//  RealmImageModel.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/29.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import Foundation
import RealmSwift

class RealmImageModel: Object {
    
    @objc dynamic var image = NSData()
    @objc dynamic var genre = String()
    
}

