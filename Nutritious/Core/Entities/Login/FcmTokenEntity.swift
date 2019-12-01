//
//  FcmTokenEntity.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 12/1/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
class FcmTokenEntity: Object, Mappable {
    @objc dynamic var fcm:String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "fcm"
    }
    
    
    
    func mapping(map: Map) {
        fcm <- map["fcm"]
    }
    
}
extension FcmTokenEntity {
    class func  getFcmToken()  -> String? {
        do {
            let realm = try Realm()
            return realm.objects(FcmTokenEntity.self).first?.fcm ?? ""
        } catch let error as NSError {
            Log.debug(message: error.description)
            return nil
        }
    }
    
    class func saveFcmToken(_ fcmToken: String) {
        do {
            let object:FcmTokenEntity = FcmTokenEntity()
            object.fcm = fcmToken
            let realm = try Realm()
            guard realm.object(ofType: FcmTokenEntity.self, forPrimaryKey: fcmToken) == nil else { return }
            try realm.write {
                realm.add(object)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}
