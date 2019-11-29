//
//  CartPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol CartView {
    
    func handleError(title: String, content: String)
    func reloadTableView()
}

protocol CartPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func numberOfFood() -> Int
    func numberOfSet() -> Int
    func getDataOfFood(row:Int) -> FoodDetailEntity
    func getDataOfSet(row:Int) -> SetDetailEntity
    func deleteCart()
    func presentFoodDetail(food:FoodDetailEntity)
}

class CartPresenterImplementation: CartPresenter {
    
    var listFoodInCart:[FoodDetailEntity] = []
    var listSetInCart:[SetDetailEntity] = []
    
    //MARK: Injections
    private var view: CartView?
    var router: CartViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle
    
    var numberOfList: Int{
        if listSetInCart.count != 0 && listFoodInCart.count != 0 {
            return 2
        }else if listFoodInCart.count == 0 || listSetInCart.count == 0{
            return 1
        }else {
            return 0
        }
        
    }
    func getDataOfSet(row: Int) -> SetDetailEntity {
        return listSetInCart[row]
    }
    
    func getDataOfFood(row: Int) -> FoodDetailEntity {
        return listFoodInCart[row]
    }
    
    func numberOfSet() -> Int {
        return listSetInCart.count
    }
    func numberOfFood() -> Int {
        return listFoodInCart.count
    }
    init(view: CartView, router: CartViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        getCart()
    }
    
    func getCart(){
        listFoodInCart = FoodDetailEntity.getFoodInCart()
        listSetInCart = SetDetailEntity.getSetInCart()
        self.view?.reloadTableView()
    }
    
    func deleteCart() {
        FoodDetailEntity.deleteAll()
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    func presentFoodDetail(food:FoodDetailEntity){
        self.router.presentFoodDetail(food: food)
    }
}

// MARK: - CartPresenterInput

