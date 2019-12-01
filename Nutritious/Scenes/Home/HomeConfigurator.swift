//
//  HomeConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol HomeConfigurable {
    func configure(viewController: HomeViewController)
}

class HomeConfigurator: HomeConfigurable {

    //MARK: HomeConfigurable
    func configure(viewController: HomeViewController) {
    
        let router = HomeRouterImplemetation(viewController: viewController)

        let categoryGateway = ApiCategoryGatewayImplementation()
        let setGateway = ApiSetGatewayImplementation()
        let presenter = HomePresenterImplementation(view:viewController,router: router, categoryGateway: categoryGateway,setGateway:setGateway)
        
        viewController.presenter = presenter

    }
}
