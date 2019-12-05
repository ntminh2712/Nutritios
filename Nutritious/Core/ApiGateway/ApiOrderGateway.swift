//
//  ApiOrderGateway.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiOrderGateway: OrderGateway {
    
}

class ApiOrderGatewayImplementation: ApiOrderGateway
{
    func order(addressId: Int, listOrder: String, notes:String, completionHandler: @escaping OrderGatewayCompletionHandler) {
        apiProvider.request(TSAPI.order(addressId, listOrder, notes)).asObservable().mapObject(SetEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func addAddresss(title: String, content: String, phone: String, completionHandler: @escaping AddressGatewayCompletionHandler) {
        apiProvider.request(TSAPI.addAddress(title, content, phone)).asObservable().mapObject(AddressEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getAddress(completionHandler: @escaping AddressGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getAddress).asObservable().mapObject(AddressEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
