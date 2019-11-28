//
//  MainTapConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol MainTapConfigurable {
    func configure(viewController: MainTapViewController)
}

class MainTapConfigurator: MainTapConfigurable {

    //MARK: MainTapConfigurable
    func configure(viewController: MainTapViewController) {
    
        let router = MainTapRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = MainTapPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
