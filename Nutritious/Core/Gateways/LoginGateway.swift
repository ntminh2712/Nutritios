//
//  LoginGateway.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias loginGatewayCompletionHandler = (_ user: Result<LoginEntity>) -> Void
typealias notificationGatewayCompletionHandler = (_ notification: Result<LoginEntity>) -> Void
typealias ProfileGatewayCompletionHandler = (_ profile: Result<ProfileEntity>) -> Void

protocol LoginGateway {
    func login(username: String, password:String, completionHandler: @escaping loginGatewayCompletionHandler)
    func addNotification(fcmToken:String, completionHandler: @escaping notificationGatewayCompletionHandler)
    
    func getProfile(completionHandler: @escaping ProfileGatewayCompletionHandler)
}
