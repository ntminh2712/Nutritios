//
//  SetDetailEntity.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class SetDetailEntity: Object, Mappable {
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
    var foods:[FoodDetailEntity] = []
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
        foods <- map["foods"]
        quantity <- map["quantity"]
    }
    
}
extension SetDetailEntity {
    class func  getSetInCart()  -> [SetDetailEntity] {
        do {
            let realm = try Realm()
            return Array(realm.objects(SetDetailEntity.self)).detached()
        } catch let error as NSError {
            Log.debug(message: error.description)
            return []
        }
    }
    
    class func addSetToCart(_ set: SetDetailEntity) {
        do {
            let realm = try Realm()
            if let setExits = realm.object(ofType: SetDetailEntity.self, forPrimaryKey: set.id) {
                try realm.safeWrite {
                    setExits.quantity = setExits.quantity + 1
                }
            }else {
                try realm.safeWrite {
                    realm.add(set)
                }
                
            }
           
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    
    class func removeFoodInCart(_ set: SetDetailEntity) {
        do {
            let realm = try Realm()
            if let setExits = realm.object(ofType: SetDetailEntity.self, forPrimaryKey: set.id) {
                if setExits.quantity > 1 {
                    try realm.write {
                        setExits.quantity = setExits.quantity - 1
                    }
                }else {
                    try realm.write {
                        realm.delete(setExits)
                    }
                }
                
            }
            
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func deleteAll(){
        do {
            let realm = try Realm()
            try realm.safeWrite {
                let set = realm.objects(SetDetailEntity.self)
                realm.delete(set)
            }
            
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}
// 2 cái này e dùng realm này a
