//
//  LoginGateway.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias loginGatewayCompletionHandler = (_ user: Result<LoginEntity>) -> Void


protocol LoginGateway {
    func login(username: String, password:String, completionHandler: @escaping loginGatewayCompletionHandler)
}
