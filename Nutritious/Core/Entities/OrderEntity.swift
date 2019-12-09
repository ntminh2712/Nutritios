//
//  OrderEntity.swift
//  Nutritious
//
//  Created by MinhNT on 12/6/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
struct OrderEntity {
    var address:Int
    var orderDetails:[OrderDetailEntity]
}

struct OrderDetailEntity {
    var foodId:Int?
    var commboId:Int?
    var quantity:Int?
    var price:Float?
}
