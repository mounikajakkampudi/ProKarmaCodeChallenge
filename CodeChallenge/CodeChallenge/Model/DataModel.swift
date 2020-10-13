//
//  DataModel.swift
//  CodeChallenge
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
    let thumbnailWidth: Int?
    let thumbnailHeight: Int?
    let title: String?
    let numComments: Int?
    let score: Int?
    init() {
        thumbnail = ""
        thumbnailWidth = 0
        thumbnailHeight = 0
        title = ""
        numComments = 0
        score = 0
    }
}
