//
//  LoginConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol LoginConfigurable {
    func configure(viewController: LoginViewController)
}

class LoginConfigurator: LoginConfigurable {

    //MARK: LoginConfigurable
    func configure(viewController: LoginViewController) {
    
        let router = LoginRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let loginGateway = ApiLoginGatewayImplementation()
        let presenter = LoginPresenterImplementation(view:viewController,router: router, loginGateway: loginGateway)
        
        viewController.presenter = presenter

    }
}
