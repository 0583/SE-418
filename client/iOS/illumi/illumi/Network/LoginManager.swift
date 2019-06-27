//
//  LoginManager.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class LoginManager {
    
    static func performLogin(userName: String,
                             passWord: String,
                             completionHandler: @escaping () -> (),
                             failureHandler: @escaping (String) -> ()) {
        
        let loginParams: Parameters = [
            "username": userName,
            "password": passWord
        ]
        
        Alamofire.request(illumiUrl.loginPostUrl,
                          method: .post,
                          parameters: loginParams).responseSwiftyJSON { responseJSON in
            if responseJSON.value?["status"].stringValue == "ok" {
                completionHandler()
            } else {
                failureHandler(responseJSON.value?["status"].string ?? "network error")
            }
        }
    }
    
    static func performLogout() {
        // Do some logout issues
    }
}
