//
//  CategoryConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol CategoryConfigurable {
    func configure(viewController: CategoryViewController)
}

class CategoryConfigurator: CategoryConfigurable {

    //MARK: CategoryConfigurable
    func configure(viewController: CategoryViewController) {
    
        let router = CategoryRouterImplemetation(viewController: viewController)
        let categoryGateway = ApiCategoryGatewayImplementation()
        let presenter = CategoryPresenterImplementation(view:viewController,router: router, categoryGateway: categoryGateway)
        
        viewController.presenter = presenter

    }
}
