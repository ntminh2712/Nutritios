//
//  ProfileRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol ProfileViewRouter{
    func presentLogin()
}

class ProfileRouterImplemetation : ProfileViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func presentLogin(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
}


