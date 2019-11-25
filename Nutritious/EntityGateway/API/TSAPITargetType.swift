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
            return "/api/auth/signin"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .login:
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
        default:
            return [:]
        }
    }
    var task: Moya.Task {
        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
//        let token = "h8T0DF9yqGKqEooDaoCkAaBL_WVjhm36"
        switch self {
//        case  .getNews, .getListGroup, .getWallpaper, .getMatches, .getLiveScore:
//            var header: [String:String]?{
//                var header: [String:String] = [:]
//                header["Authorization"] = "Bearer \(token)"
//                return header
//            }
//            return header
        default:
            return [:]
        }
        return [:]
    }
    
    
    
}

