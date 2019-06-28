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

    
    init(ImageId: Int) {
        imageId = ImageId
    }
    
    func getImageTags(tagsHandler: @escaping ([illumiTag]) -> (),
                      errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "id": imageId
        ]
        Alamofire.request(illumiUrl.tagByImageIdGetUrl, method: .get, parameters: getParams)
        .responseSwiftyJSON(completionHandler: { swiftyJSON in
            
        })
    }
    
    func getImageContent(imageHandler: @escaping (UIImage) -> (),
                         errorHandler: @escaping (String) -> ()) {
        let getParams: Parameters = [
            "id": imageId
        ]
        
        Alamofire.request(illumiUrl.imageGetUrl, method: .get, parameters: getParams).response(completionHandler: { response in
            if response.data == nil {
                errorHandler("Failed to request image #\(self.imageId). Status Code: \(response.response?.statusCode ?? -1)")
            } else {
                let img = UIImage(data: response.data!)
                if img == nil {
                    errorHandler("Failed to decode image #\(self.imageId). Status Code: \(response.response?.statusCode ?? -1)")
                } else {
                    imageHandler(img!)
                }
            }
        })
    }
}
