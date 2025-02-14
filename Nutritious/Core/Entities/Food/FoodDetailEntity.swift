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
    @objc dynamic var id:Int = 0
    @objc dynamic var name:String = ""
    @objc dynamic var image:String = ""
    @objc dynamic var _description:String = ""
    @objc dynamic var price:Float = 0.0
    @objc dynamic var carbonhydrates:Float = 0.0
    @objc dynamic var protein:Float = 0.0
    @objc dynamic var lipid:Float = 0.0
    @objc dynamic var xenluloza:Float = 0.0
    @objc dynamic var canxi:Float = 0.0
    @objc dynamic var iron:Float = 0.0
    @objc dynamic var zinc:Float = 0.0
    @objc dynamic var vitaminA:Float = 0.0
    @objc dynamic var vitaminB:Float = 0.0
    @objc dynamic var vitaminC:Float = 0.0
    @objc dynamic var vitaminD:Float = 0.0
    @objc dynamic var vitaminE:Float = 0.0
    @objc dynamic var calorie:Float = 0.0
    @objc dynamic var weight:Float = 0.0
    @objc dynamic var quantity:Int = 1
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
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
        quantity <- map["quantity"]
    }
    
}
extension FoodDetailEntity {
    class func  getFoodInCart()  -> [FoodDetailEntity] {
        do {
            let realm = try Realm()
            return Array(realm.objects(FoodDetailEntity.self)).detached()
        } catch let error as NSError {
            Log.debug(message: error.description)
            return []
        }
    }
    
    class func addFoodToCart(_ food: FoodDetailEntity) {
        do {
            let realm = try Realm()
                if let foodExits = realm.object(ofType: FoodDetailEntity.self, forPrimaryKey: food.id) {
                    try realm.write {
                        foodExits.quantity = foodExits.quantity + 1
                        realm.add(foodExits, update: .modified)
                    }
                }else {
                    try realm.safeWrite {
                        let object:FoodDetailEntity = FoodDetailEntity()
                        object.id = food.id
                        object.name = food.name
                        object.image = food.image
                        object._description = food._description
                        object.price = food.price
                        object.carbonhydrates = food.carbonhydrates
                        object.protein = food.protein
                        object.lipid = food.lipid
                        object.xenluloza = food.xenluloza
                        object.canxi = food.canxi
                        object.iron = food.iron
                        object.zinc = food.zinc
                        object.vitaminA = food.vitaminA
                        object.vitaminB = food.vitaminB
                        object.vitaminC = food.vitaminC
                        object.vitaminD = food.vitaminD
                        object.vitaminE = food.vitaminE
                        object.calorie = food.calorie
                        object.weight = food.weight
                        object.quantity = food.quantity
                        realm.add(object,update: .all)
                    }
                }
            
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    
    class func removeFoodInCart(_ food: FoodDetailEntity) {
        do {
            let realm = try Realm()
            if let foodExits = realm.object(ofType: FoodDetailEntity.self, forPrimaryKey: food.id) {
                if foodExits.quantity > 1 {
                    try realm.safeWrite {
                        foodExits.quantity = foodExits.quantity - 1
                        realm.add(foodExits, update: .modified)
                    }
                }else {
                    try realm.safeWrite {
                        
                        realm.delete(foodExits)
                    }
                }
                
            }
            
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func deleteAll(){
        do {
            let realm = try! Realm()
            try realm.safeWrite {
                realm.deleteAll()
            }
            
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}
extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
