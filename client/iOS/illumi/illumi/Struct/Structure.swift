//
//  Structure.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit
import Alamofire
import Alamofire_SwiftyJSON

class illumiTag {
    var tagId: Int
    var tagName: String
    
    init(TagId: Int, TagName: String) {
        tagId = TagId
        tagName = TagName
    }
}

class illumiImage {
    
    var imageId: Int
    var author: String?
    
    init(ImageId: Int) {
        imageId = ImageId
    }
    
    func getImageTags(tagsHandler: @escaping ([illumiTag]) -> (),
                      errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "id": imageId
        ]
        Alamofire.request(illumiUrl.imageInfoGetUrl, method: .get, parameters: getParams)
        .responseSwiftyJSON(completionHandler: { swiftyJSON in
            if swiftyJSON.value?.dictionaryValue["status"] == "ok" {
                let author = swiftyJSON.value?["values"]["username"].stringValue
                var tags: [illumiTag] = [illumiTag(TagId: -1, TagName: "author:\(author ?? "unknown")")]
                for tag in (swiftyJSON.value?.dictionaryValue["values"]?.dictionaryValue["tags"]!.arrayValue)! {
                    let id = tag["tagid"].int
                    let name = tag["tagname"].string
                    
                    if id != nil && name != nil {
                        tags.append(illumiTag(TagId: id!, TagName: name!))
                    }
                }
                tagsHandler(tags)
            } else {
                errorHandler("Server reported an “\(swiftyJSON.value?.dictionaryValue["status"] ?? "unknown")” error")
            }
        })
    }
    
    func getImageContent(imageHandler: @escaping (UIImage) -> (),
                         errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "id": imageId
        ]
        
        Alamofire.request(illumiUrl.imageGetUrl, method: .get, parameters: getParams).response(completionHandler: { response in
            if response.data == nil {
                errorHandler("image #\(self.imageId) request error. (- \(response.response?.statusCode ?? -1))")
            } else {
                let img = UIImage(data: response.data!)
                if img == nil {
                    errorHandler("image #\(self.imageId) decode error. (- \(response.response?.statusCode ?? -1))")
                } else {
                    imageHandler(img!)
                }
            }
        })
    }
}
