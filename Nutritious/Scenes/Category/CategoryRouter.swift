//
//  CategoryRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol CategoryViewRouter{
    func presentListCategory(category:CategoryDetailEntity)
}

class CategoryRouterImplemetation : CategoryViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func presentListCategory(category:CategoryDetailEntity){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "listCategoryViewController") as! ListCategoryViewController
        newExploreController.categoryList = category
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
}


