//
//  SetDetailConfigurator.swift
//  Nutritious
//
//  Created by MinhNT on 12/2/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol SetDetailConfigurable {
    func configure(viewController: SetDetailViewController)
}

class SetDetailConfigurator: SetDetailConfigurable {

    //MARK: SetDetailConfigurable
    func configure(viewController: SetDetailViewController) {
    
        let router = SetDetailRouterImplemetation(viewController: viewController)
        let setGateway = ApiSetGatewayImplementation()
        let presenter = SetDetailPresenterImplementation(view:viewController,router: router, setGateway: setGateway)
        
        viewController.presenter = presenter

    }
}
