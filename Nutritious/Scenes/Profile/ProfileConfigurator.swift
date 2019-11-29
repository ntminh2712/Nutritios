//
//  ProfileConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol ProfileConfigurable {
    func configure(viewController: ProfileViewController)
}

class ProfileConfigurator: ProfileConfigurable {

    //MARK: ProfileConfigurable
    func configure(viewController: ProfileViewController) {
    
        let router = ProfileRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = ProfilePresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
