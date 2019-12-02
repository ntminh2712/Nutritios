//
//  ListCategoryConfigurator.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 11/30/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol ListCategoryConfigurable {
    func configure(viewController: ListCategoryViewController)
}

class ListCategoryConfigurator: ListCategoryConfigurable {

    //MARK: ListCategoryConfigurable
    func configure(viewController: ListCategoryViewController) {
    
        let router = ListCategoryRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = ListCategoryPresenterImplementation(view: viewController,router: router)
        
        viewController.presenter = presenter

    }
}
