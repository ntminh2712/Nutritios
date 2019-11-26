//
//  CategoryDetailEntity.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class CategoryDetailEntity: Object, Mappable {
    var id:Int = 0
    var parentId:Int = 0
    var name:String = ""
    var image:String = ""
    var combos:[SetDetailEntity] = []
    var foods:[FoodDetailEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    
    func mapping(map: Map) {
        id <- map["id"]
        parentId <- map["parentId"]
        name <- map["name"]
        image <- map["image"]
        combos <- map["combos"]
        foods <- map["foods"]
    }
    
}
