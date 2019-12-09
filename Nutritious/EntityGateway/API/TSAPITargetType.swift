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
            return "/order"
        case .addAddress:
            return "/address"
        case .getAddress:
            return "/address"
        case .getMe:
            return "/auth/me"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .addNotification, .order, .addAddress:
            return .post
        case .getCategory, .getSuggestSet, .getSetDetail,.getAddress,.getMe:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getCategory, .getSuggestSet, .getSetDetail,  .getAddress,.getMe:
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
        case .order(let addressId, let listOrder, let note):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["addressId"] = addressId
                parameter["note"] = note
                parameter["type"] = 1
                var orderParameter:[Any] = []
                for item in listOrder {
                    var subParameter: [String: Any] = [:]
                    subParameter["foodId"] = item.foodId
                    subParameter["quantity"] = item.quantity
                    subParameter["comboId"] = item.commboId
                    orderParameter.append(subParameter)
                }
                parameter["orderDetails"] = orderParameter
                return parameter
            }
            return paramester
        case .addAddress(let title, let content, let phone):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["title"] = title
                parameter["content"] = content
                parameter["phone"] = phone
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
        case .addNotification, .order, .addAddress, .getAddress,.getMe:
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

