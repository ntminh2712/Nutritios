//
//  UserEntity.swift
//  FoxLive
//
//  Created by HOANDHTB on 10/4/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper
class LoginEntity: Object, Mappable {
    var status:Int = 0
    var message:String = ""
    @objc dynamic var token:String = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "token"
    }
    
   
    
    func mapping(map: Map) {
        token <- map["accessToken"]
        status <- map["status"]
        message <- map["message"]
    }
    
}
extension LoginEntity {
    class func  getToken()  -> String {
        do {
            let realm = RealmConnectorManager.connectDefault()
            return realm!.objects(LoginEntity.self).first?.token ?? ""
        } catch let error as NSError {
            Log.debug(message: error.description)
            return ""
        }
    }
    
    class func saveToken(_ token: String) {
        do {
            let object:LoginEntity = LoginEntity()
            object.token = token
            let realm = RealmConnectorManager.connectDefault()
            guard realm?.object(ofType: LoginEntity.self, forPrimaryKey: token) == nil else { return }
            try realm?.write {
                realm?.add(object)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func deleteToken() {
        do {
            let realm = RealmConnectorManager.connectDefault()
            guard let token = realm?.objects(LoginEntity.self) else { return }
            try realm?.write {
                realm?.delete(token)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}
