//
//  TagManager.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation


class TagManager {
    static var allTags: [illumiTag] = []
    
    static func refreshTags() {
        
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
