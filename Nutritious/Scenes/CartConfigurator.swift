//
//  CartConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol CartConfigurable {
    func configure(viewController: CartViewController)
}

class CartConfigurator: CartConfigurable {

    //MARK: CartConfigurable
    func configure(viewController: CartViewController) {
    
        let router = CartRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = CartPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
