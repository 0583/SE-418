//
//  TagManager.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation
import Alamofire_SwiftyJSON
import Alamofire
import SwiftyJSON

class TagManager {
    static var allTags: [illumiTag] = []
    
    static func refreshTags() {
        TagManager.allTags.removeAll()
        Alamofire.request(illumiUrl.tagAllGetUrl,
                          method: .get)
        .responseSwiftyJSON(completionHandler: { swiftyJSON in
            if swiftyJSON.value == nil {
                return
            }
            if swiftyJSON.value?["status"].stringValue == "ok" {
                
                let contentJSON = swiftyJSON.value?["values"]
                for tag in contentJSON!.arrayValue {
                    let id = tag.dictionaryValue["tagid"]?.intValue
                    let name = tag.dictionaryValue["tagname"]?.stringValue
                    if id != nil && name != nil {
                        allTags.append(illumiTag(TagId: id!, TagName: name!))
                    }
                }
            }
        })
    }
    
    static func getTagById(targetTagId: Int) -> illumiTag? {
        for tag in TagManager.allTags {
            if tag.tagId == targetTagId {
                return tag
            }
        }
        return nil
    }
}
