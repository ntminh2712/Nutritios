//
//  SetDetailPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 12/2/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol SetDetailView {
    
    func handleError(title: String, content: String)
    func reloadData()
    func setData(set:SetDetailEntity)
}

protocol SetDetailPresenter {
    func viewDidLoad(setId:Int)
    var numberOfList:Int {get}
    func getDataFood(row:Int) -> FoodDetailEntity
    func presentFoodDetail(row:Int)
    func addFoodToCart(row:Int)
    func addSetToCart()
    func getDataSet() -> SetDetailEntity?
}

class SetDetailPresenterImplementation: SetDetailPresenter {
    
    
    
    
    var listFoodOfSet:[FoodDetailEntity] = []
    var set:SetDetailEntity?{
        didSet{
            self.view?.setData(set: self.set!)
        }
    }
    //MARK: Injections
    private var view: SetDetailView?
    var router: SetDetailViewRouter?
    var setGateway:SetGateway?
    //    var Gateway: Gateway?
    //MARK: LifeCycle
    var numberOfList: Int{
        return listFoodOfSet.count
    }
    func getDataFood(row: Int) -> FoodDetailEntity {
        return listFoodOfSet[row]
    }
    
    func getDataSet() -> SetDetailEntity? {
        return set
    }
    init(view: SetDetailView, router: SetDetailViewRouter, setGateway:SetGateway) {
        self.view = view
        self.router = router
        self.setGateway = setGateway
    }
    
    func addFoodToCart(row: Int) {
        FoodDetailEntity.addFoodToCart(listFoodOfSet[row])
    }
    
    func addSetToCart() {
        SetDetailEntity.addSetToCart(set!)
    }
    func viewDidLoad(setId: Int) {
        getSetDetail(setId: setId)
    }
    
    func getSetDetail(setId:Int){
        setGateway?.getSetDetail(setId: setId, completionHandler: { (result) in
            switch result {
            case let .success(data):
                if data.status == CodeResponse.success {
                    self.listFoodOfSet = data.data?.foods ?? []
                    self.set = data.data!
                    self.view?.reloadData()
                }else {
                    self.view?.handleError(title: "Error", content: data.message)
                }
                break
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
            }
        })
    }
    
    func presentFoodDetail(row: Int) {
        self.router?.presentFoodDetail(food: listFoodOfSet[row])
    }
}
