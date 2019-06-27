//
//  ImageLoader.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import Foundation

class ImageLoader {
    static func loadImageById(id: Int,
                              imageHandler: @escaping (UIImage) -> (),
                              errorHandler: @escaping (String) -> ()) {
        let image = illumiImage(ImageId: id)
        image.getImageContent(imageHandler: imageHandler, errorHandler: errorHandler)
    }
    
    static func loadImageByTag(tagId: Int,
                               completionHandler: @escaping ([illumiImage]) -> (),
                               errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "id": tagId
        ]
        Alamofire.request(illumiUrl.imageByTagGetUrl,
                          method: .get,
                          parameters: getParams)
            .responseSwiftyJSON(completionHandler: { responseJSON in
                if responseJSON.value?["status"].stringValue == "ok" {
                    let contentImageArray = responseJSON.value?["values"].arrayValue
                    var images: [illumiImage] = []
                    for item in contentImageArray! {
                        let imageItem = item.dictionaryValue
                        images.append(illumiImage(ImageId: imageItem["imageid"]!.intValue))
                    }
                    completionHandler(images)
                } else {
                    errorHandler("Server Reported an error: “ \(responseJSON.value?["status"].string ?? "general error")”")
                }
            })
    }
    
    static func loadImageByUser(userName: String,
                               completionHandler: @escaping ([illumiImage]) -> (),
                               errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "username": userName
        ]
        Alamofire.request(illumiUrl.imageByUserGetUrl,
                          method: .get,
                          parameters: getParams)
            .responseSwiftyJSON(completionHandler: { responseJSON in
                if responseJSON.value?["status"].stringValue == "ok" {
                    let contentImageArray = responseJSON.value?["values"].arrayValue
                    var images: [illumiImage] = []
                    for item in contentImageArray! {
                        let imageItem = item.dictionaryValue
                        images.append(illumiImage(ImageId: imageItem["imageid"]!.intValue))
                    }
                    completionHandler(images)
                } else {
                    errorHandler("Server Reported an error: “ \(responseJSON.value?["status"].string ?? "general error")”")
                }
            })
    }
}
