//
//  FoodDetailEntity.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class FoodDetailEntity: Object, Mappable {
    var id:Int = 0
    var name:String = ""
    var image:String = ""
    var _description:String = ""
    var price:Float = 0.0
    var carbonhydrates:Float = 0.0
    var protein:Float = 0.0
    var lipid:Float = 0.0
    var xenluloza:Float = 0.0
    var canxi:Float = 0.0
    var iron:Float = 0.0
    var zinc:Float = 0.0
    var vitaminA:Float = 0.0
    var vitaminB:Float = 0.0
    var vitaminC:Float = 0.0
    var vitaminD:Float = 0.0
    var vitaminE:Float = 0.0
    var calorie:Float = 0.0
    var weight:Float = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        image <- map["image"]
        _description <- map["description"]
        price <- map["price"]
        carbonhydrates <- map["carbonhydrates"]
        protein <- map["protein"]
        lipid <- map["lipid"]
        xenluloza <- map["xenluloza"]
        canxi <- map["canxi"]
        iron <- map["iron"]
        zinc <- map["zinc"]
        vitaminA <- map["vitaminA"]
        vitaminB <- map["vitaminB"]
        vitaminC <- map["vitaminC"]
        vitaminD <- map["vitaminD"]
        vitaminE <- map["vitaminE"]
        calorie <- map["calorie"]
        weight <- map["weight"]
    }
    
}
