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
            return "/api/suggest/combo"
        case .addNotification:
            return "/api/devices"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .addNotification:
            return .post
        case .getCategory, .getSuggestSet:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .login, .getCategory, .getSuggestSet, .addNotification:
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
        default:
            return [:]
        }
    }
    var task: Moya.Task {
        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        let token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI2IiwiaWF0IjoxNTc0NzUzMTk2LCJleHAiOjE1NzUzNTc5OTZ9.amBTcwUiGG0hQrBJGj8zpcwY-CZuKJryVV1-_bZynom6AgxUDU9auPE6YD8ZVRsb3Ko1HAivI2xpT0G-uvmllQ"
        switch self {
        case  .getCategory, .addNotification, .getSuggestSet:
            var header: [String:String]?{
                var header: [String:String] = [:]
                header["Authorization"] = token
                header["Content-Type"] = "application/x-www-form-urlencoded"
                return header
            }
            return header
        default:
            return [:]
        }
    }
    
    
    
}

