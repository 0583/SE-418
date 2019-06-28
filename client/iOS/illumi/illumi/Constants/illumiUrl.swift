//
//  illumiUrl.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation


class illumiUrl {
    
    static let baseIp = "http://47.103.15.32:8086"
//    static let baseIp = "http://94.191.27.99:8086"
    // parameters:
    // username - Username, String
    // password - Password, String
    static let loginPostUrl = baseIp + "/login"
    
    // parameters: <None>
    static let logoutPostUrl = baseIp + "/logout"
    
    // parameters:
    // id - Image ID, Integer
    static let imageGetUrl = baseIp + "/lookOneImage"
    
    // parameters:
    // id - Tag ID, Integer
    static let imageByTagGetUrl = baseIp + "/getImageByTag"
    
    // parameters:
    // username - Username, String
    static let imageByUserGetUrl = baseIp + "/getImageByUsername"
    
    // [deprecated]
    // parameters:
    // id - Image ID, Integer
//    static let tagByImageIdGetUrl = "http://94.191.27.99:8086/"
    
    // parameters:
    // id - Image ID, Integer
    static let imageInfoGetUrl = baseIp + "/getImageInfo"
    
    // parameters: <None>
    static let tagAllGetUrl = baseIp + "/getAllTag"
    
    static let imagePostUrl = baseIp + "/"
}
