//
//  HistoryConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol HistoryConfigurable {
    func configure(viewController: HistoryViewController)
}

class HistoryConfigurator: HistoryConfigurable {

    //MARK: HistoryConfigurable
    func configure(viewController: HistoryViewController) {
    
        let router = HistoryRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = HistoryPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
