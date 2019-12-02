//
//  ApiSetGateway.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 12/1/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiSetGateway: SetGateway {
    
}

class ApiSetGatewayImplementation: ApiSetGateway
{

    func getSetSuggest(completionHandler: @escaping SetGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getSuggestSet).asObservable().mapObject(SetEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getSetDetail(setId: Int, completionHandler: @escaping SetDetailGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getSetDetail(setId)).asObservable().mapObject(SetEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
}
