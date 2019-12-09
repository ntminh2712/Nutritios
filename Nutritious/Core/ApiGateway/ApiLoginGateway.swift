//
//  ApiLoginGateway.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiLoginGateway: LoginGateway {
    
}

class ApiLoginGatewayImplementation: ApiLoginGateway
{
    func login(username: String, password: String, completionHandler: @escaping loginGatewayCompletionHandler) {
        apiProvider.request(TSAPI.login(username, password)).asObservable().mapObject(LoginEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func addNotification(fcmToken: String, completionHandler: @escaping notificationGatewayCompletionHandler) {
        apiProvider.request(TSAPI.addNotification(fcmToken)).asObservable().mapObject(LoginEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getProfile(completionHandler: @escaping ProfileGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getMe).asObservable().mapObject(ProfileEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
