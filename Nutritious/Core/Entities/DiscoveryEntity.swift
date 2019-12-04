//
//  DiscoveryEntity.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
struct DiscoveryDetailEntity: Decodable {
    
    var id:Int
    var name:String
    var description:String
    var image:String
    var url:String
    
}
struct DiscoveryEntity: Decodable {
    var discover:[DiscoveryDetailEntity]
    
}
