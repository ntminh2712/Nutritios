//
//  SetEntity.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class SetEntity: Object, Mappable {
    var status:Int = 0
    var message:String = ""
    var data:[SetDetailEntity] = []
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
    
}
