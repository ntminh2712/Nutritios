//
//  OrderGateway.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias OrderGatewayCompletionHandler = (_ category: Result<SetEntity>) -> Void
typealias AddressGatewayCompletionHandler = (_ address: Result<AddressEntity>) -> Void

protocol OrderGateway {
    
    func order(addressId:Int , listOrder :String, notes:String, completionHandler: @escaping OrderGatewayCompletionHandler)
    
    func addAddresss(title:String, content:String, phone:String, completionHandler: @escaping AddressGatewayCompletionHandler)
    func getAddress(completionHandler: @escaping AddressGatewayCompletionHandler)
}
