//
//  ProfileDetailEntity.swift
//  Nutritious
//
//  Created by MinhNT on 12/6/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class ProfileDetailEntity: Object, Mappable {
    var id:Int = 0
    var name:String = ""
    var username:String = ""
    var email:String = ""
    var phone:String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        phone <- map["phone"]
    }
    
}
