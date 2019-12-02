//
//  FoodDetailPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol FoodDetailView {
    
    func handleError(title: String, content: String)
    
}

protocol FoodDetailPresenter {
    func viewDidLoad()
    func addFoodToCart(food:FoodDetailEntity)
}

class FoodDetailPresenterImplementation: FoodDetailPresenter {
    
    //MARK: Injections
    private var view: FoodDetailView?
    var router: FoodDetailViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: FoodDetailView, router: FoodDetailViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func addFoodToCart(food:FoodDetailEntity){
        FoodDetailEntity.addFoodToCart(food)
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - FoodDetailPresenterInput

