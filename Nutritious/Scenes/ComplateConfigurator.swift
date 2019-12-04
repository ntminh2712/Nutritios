//
//  ComplateConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol ComplateConfigurable {
    func configure(viewController: ComplateViewController)
}

class ComplateConfigurator: ComplateConfigurable {

    //MARK: ComplateConfigurable
    func configure(viewController: ComplateViewController) {
    
        let router = ComplateRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = ComplatePresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
