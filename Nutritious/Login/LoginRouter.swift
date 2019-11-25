//
//  LoginRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol LoginViewRouter{
    func presentHome()
}

class LoginRouterImplemetation : LoginViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func presentHome(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "mainTapViewController") as! MainTapViewController
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
}


