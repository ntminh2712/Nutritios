//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//


import Foundation

enum TSAPI
{
    case login(String?,String?)
    case getCategory
    case getSuggestSet
    case addNotification(String)
    case getSetDetail(Int)
    case order(Int,String,String)
    case addAddress(String,String,String)
    case getAddress
}
 
struct OrderEntity {
    var address:Int
    var orderDetails:[OrderDetailEntity]
}

struct OrderDetailEntity {
    var foodId:Int?
    var commbo:Int?
    var scheduleId:Int?
    var quantity:Int?
    var price:Float?
}
