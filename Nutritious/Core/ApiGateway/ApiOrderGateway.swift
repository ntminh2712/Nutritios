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
    func order(addressId: Int, listOrder: String, completionHandler: @escaping OrderGatewayCompletionHandler) {
        apiProvider.request(TSAPI.order(addressId, listOrder)).asObservable().mapObject(SetEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    
}
