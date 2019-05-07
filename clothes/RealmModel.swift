//
//  RealmModel.swift
//  clothes
//
//  Created by Haru Ichiue on 2018/12/11.
//  Copyright © 2018年 Haru Ichiue. All rights reserved.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    
    @objc dynamic var image = NSData()
    @objc dynamic var genre = String()
    @objc dynamic var date = String()
    
}
