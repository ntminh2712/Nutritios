//
//  OrderGateway.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias OrderGatewayCompletionHandler = (_ category: Result<SetEntity>) -> Void

protocol OrderGateway {
    
    func order(addressId:Int , listOrder :String, completionHandler: @escaping OrderGatewayCompletionHandler)
}
