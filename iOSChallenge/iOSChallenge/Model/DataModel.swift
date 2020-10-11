//
//  DataModel.swift
//  iOSChallenge
//
//  Created by Mounika Jakkampudi on 10/9/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import Foundation

struct ResponseDataObject: Decodable {
    let kind: String?
    let data: ListDataObject?
}

struct ListDataObject: Decodable {
    let dist: Int?
    let before: String?
    let after: String?
    let children: [Children]?
    let modhash: String?
}

struct Children: Decodable {
    let kind: String?
    let data: ChildrenDataObject?
}

struct ChildrenDataObject: Decodable {
    let thumbnail: String?
    let thumbnail_width: Int?
    let thumbnail_height: Int?
    let title: String?
    let numComments: Int?
    let score: Int?
    
    init() {
        thumbnail = ""
        thumbnail_width = 0
        thumbnail_height = 0
        title = ""
        numComments = 0
        score = 0
    }
    
}
