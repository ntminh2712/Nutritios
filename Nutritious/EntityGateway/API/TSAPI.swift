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
}
 
