//
//  SetGateway.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 12/1/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias SetGatewayCompletionHandler = (_ category: Result<SetEntity>) -> Void


protocol SetGateway {
    func getSetSuggest(completionHandler: @escaping SetGatewayCompletionHandler)
}
