//
//  CategoryGateway.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias CategoryGatewayCompletionHandler = (_ category: Result<CategoryEntity>) -> Void


protocol CategoryGateway {
    func getCategory(completionHandler: @escaping CategoryGatewayCompletionHandler)
}
