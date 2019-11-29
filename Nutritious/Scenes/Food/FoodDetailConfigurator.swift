//
//  FoodDetailConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol FoodDetailConfigurable {
    func configure(viewController: FoodDetailViewController)
}

class FoodDetailConfigurator: FoodDetailConfigurable {

    //MARK: FoodDetailConfigurable
    func configure(viewController: FoodDetailViewController) {
    
        let router = FoodDetailRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = FoodDetailPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
