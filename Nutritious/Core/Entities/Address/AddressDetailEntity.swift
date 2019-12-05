//
//  AddressDetailEntity.swift
//  Nutritious
//
//  Created by MinhNT on 12/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class AddressDetailEntity: Object, Mappable {
    var id:Int = 0
    var title:String = ""
    var phone:String = ""
    var content:String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        phone <- map["phone"]
        content <- map["content"]
    }
    
}
