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
    func setQuantity(quantity:Int)
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
    func setQuantityFood(food:FoodDetailEntity)
    func removeFood()
    func addFood()
    func addSet()
    func removeSet()
    func setQuantitySet(set:SetDetailEntity)
    func presentSetDetail(row:Int)
}

class CartPresenterImplementation: CartPresenter {
    
    var listFoodInCart:[FoodDetailEntity] = []
    var listSetInCart:[SetDetailEntity] = []
    
    var listOrder:[OrderDetailEntity] = []
    //MARK: Injections
    private var view: CartView?
    var router: CartViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle
    
    var handlerQuantityFood:FoodDetailEntity?
    var handlerQuantitySet:SetDetailEntity?
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
    
    func removeFood() {
        FoodDetailEntity.removeFoodInCart(handlerQuantityFood!)
        self.view?.setQuantity(quantity: handlerQuantityFood!.quantity)
        getCart()
    }
    
    func addFood() {
        FoodDetailEntity.addFoodToCart(handlerQuantityFood!)
        self.view?.setQuantity(quantity: handlerQuantityFood!.quantity)
        getCart()
    }
    
    func setQuantityFood(food: FoodDetailEntity) {
        handlerQuantityFood = food
    }
    
    func setQuantitySet(set: SetDetailEntity) {
        handlerQuantitySet = set
    }
    
    func addSet() {
        SetDetailEntity.addSetToCart(handlerQuantitySet!)
        self.view?.setQuantity(quantity: handlerQuantitySet!.quantity)
        getCart()
    }
    
    func removeSet() {
        SetDetailEntity.removeFoodInCart(handlerQuantitySet!)
        self.view?.setQuantity(quantity: handlerQuantitySet!.quantity)
        getCart()
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
    
    func checkout(){
        for food in listFoodInCart {
            let order:OrderDetailEntity = OrderDetailEntity(foodId: food.id, commbo: nil, scheduleId: nil, quantity: food.quantity,price: food.price)
            listOrder.append(order)
        }
        for set in listSetInCart {
            let order:OrderDetailEntity = OrderDetailEntity(foodId: nil , commbo: set.id, scheduleId: nil, quantity: set.quantity,price: set.price)
            listOrder.append(order)
        }
    }
    
    func presentFoodDetail(food:FoodDetailEntity){
        self.router.presentFoodDetail(food: food)
    }
    
    func presentSetDetail(row:Int){
        self.router.presentSetDetail(set: listSetInCart[row])
    }
}

// MARK: - CartPresenterInput

