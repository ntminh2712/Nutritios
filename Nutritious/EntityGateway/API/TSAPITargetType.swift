//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation


import UIKit
import Moya
import RxSwift
extension TSAPI:TargetType
{
    var baseURL: URL {
        return URL(string: Config.rootUrl)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/signin"
        case .getCategory:
            return "/category"
        case .getSuggestSet:
            return "/suggest/combo"
        case .getSetDetail(let setId):
            return "/combo/\(setId)"
        case .addNotification:
            return "/devices"
        case .order:
            return "/api/order"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .addNotification, .order:
            return .post
        case .getCategory, .getSuggestSet, .getSetDetail:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getCategory, .getSuggestSet, .getSetDetail:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    
    var sampleData: Data {
        switch self {
        default:
            guard let url = Bundle.main.url(forResource: "Demo", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    public var parameters: [String : Any]? {
        switch self {
        case .login(let username, let password):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["account"] = username
                parameter["password"] = password
                return parameter
            }
            return paramester
        case .addNotification(let fcmToken):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["id"] = fcmToken
                return parameter
            }
            return paramester
        case .order(let addressId, let listOrder):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["address"] = addressId
                parameter["orderDetails"] = listOrder
                return parameter
            }
            return paramester
        default:
            return [:]
        }
    }
    var task: Moya.Task {
        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        switch self {
        case  .getCategory, .getSuggestSet, .getSetDetail:
            var header: [String:String]?{
                var header: [String:String] = [:]
                if let token = LoginEntity.getToken() {
                    header["Authorization"] = token
                }
                header["Content-Type"] = "application/x-www-form-urlencoded"
                return header
            }
            return header
        case .addNotification, .order:
            var header: [String:String]?{
                var header: [String:String] = [:]
                if let token = LoginEntity.getToken() {
                    header["Authorization"] = token
                }
                header["Content-Type"] = "application/json"
                return header
            }
            return header
        case.login:
            var header: [String:String]?{
                var header: [String:String] = [:]
                header["Content-Type"] = "application/json"
                return header
            }
            return header
        default:
            return [:]
        }
    }
    
    
    
}

