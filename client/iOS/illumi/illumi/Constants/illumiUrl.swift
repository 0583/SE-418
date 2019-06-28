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
    
    // parameters: <None>
    static let logoutPostUrl = "http://94.191.27.99:8086/logout"
    
    // parameters:
    // id - Image ID, Integer
    static let imageGetUrl = "http://94.191.27.99:8086/lookOneImage"
    
    // parameters:
    // id - Tag ID, Integer
    static let imageByTagGetUrl = "http://94.191.27.99:8086/getImageByTag"
    
    // parameters:
    // username - Username, String
    static let imageByUserGetUrl = "http://94.191.27.99:8086/getImageByUsername"
    
    // parameters:
    // id - Image ID, Integer
    static let tagByImageIdGetUrl = "http://94.191.27.99:8086/"
    
    // parameters: <None>
    static let tagAllGetUrl = "http://94.191.27.99:8086/getAllTag"
    
    static let imagePostUrl = "http://94.191.27.99:8086/"
}
