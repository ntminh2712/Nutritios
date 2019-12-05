//
//  AddressEntity.swift
//  Nutritious
//
//  Created by MinhNT on 12/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class AddressEntity: Object, Mappable {
    var status:Int = 0
    var message:String = ""
    var data:AddressDetailEntity?
    var listAddress:[AddressDetailEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        listAddress <- map["data"]
    }
    
}
