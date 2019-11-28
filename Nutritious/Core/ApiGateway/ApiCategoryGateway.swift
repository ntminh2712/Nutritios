//
//  ApiCategoryGateway.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiCategoryGateway: CategoryGateway {
    
}

class ApiCategoryGatewayImplementation: ApiCategoryGateway
{

    func getCategory(completionHandler: @escaping CategoryGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getCategory).asObservable().mapObject(CategoryEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
}
