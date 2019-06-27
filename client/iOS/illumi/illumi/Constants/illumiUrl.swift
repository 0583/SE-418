//
//  illumiUrl.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation

class illumiUrl {
    // parameters:
    // username - Username, String
    // password - Password, String
    static let loginPostUrl = "http://94.191.27.99:8086/login"
    
    // parameters:
    // id - picture's Id, Integer
    static let imageGetUrl = "http://94.191.27.99:8086/getOneImage"
    
    // parameters:
    // id - Tag's Id, Integer
    static let imageByTagGetUrl = "http://94.191.27.99:8086/getImageByTag"
    
    // parameters:
    // username - Username, String
    static let imageByUserGetUrl = "http://94.191.27.99:8086/getImageByUsername"
}
