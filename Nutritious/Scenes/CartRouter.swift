//
//  CartRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol CartViewRouter{
    func presentFoodDetail(food:FoodDetailEntity)
    func presentSetDetail(set:SetDetailEntity)
    func presentComplate(listOrder:[OrderDetailEntity])
}

class CartRouterImplemetation : CartViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func presentFoodDetail(food:FoodDetailEntity){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "foodDetailViewController") as! FoodDetailViewController
        newExploreController.food = food
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
    func presentSetDetail(set:SetDetailEntity){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "setDetailViewController") as! SetDetailViewController
        newExploreController.setId = set.id
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
    func presentComplate(listOrder:[OrderDetailEntity]){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "complateViewController") as! ComplateViewController
        newExploreController.listOrder = listOrder
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
}


