//
//  FoodEntity.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class FoodEntity: Object, Mappable {
    var status:Int = 0
    var message:String = ""
    var data:[CategoryDetailEntity] = []
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "token"
    }
    
    
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
    
}
