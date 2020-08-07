//
//  item.swift
//  Day5
//
//  Created by TuanDA on 8/7/20.
//  Copyright © 2020 TuanDA. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class Item: Mappable {
    // MARK: - Properties
    var code: Int = 0
    var userInfo: UserInfo?

    required init?(map: Map) {}

    // MARK: - Mappable

    func mapping(map: Map) {
        code <- map["code"]
        userInfo <- map["user"]
    }
}


struct UserInfo: Mappable {

    // MARK: - Properties

    var accessToken: String?
    var email: String?
    var fullname: String?
    var idUser: String?
    var phone: String?

    init?(map: Map) {}

    // MARK: - Mappable

    mutating func mapping(map: Map) {
        accessToken <- map["accessToken"]
        email <- map["email"]
        fullname <- map["fullname"]
        idUser <- map["id"]
        phone <- map["phone"]
    }
}

