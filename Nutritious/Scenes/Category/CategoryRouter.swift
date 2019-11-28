//
//  CategoryRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol CategoryViewRouter{
//    func presentExample(leaguesId:Int)
}

class CategoryRouterImplemetation : CategoryViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
//    func presentExample(leaguesId:Int){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
//        newExploreController.leaguesId = leaguesId
//        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
//    }
}


