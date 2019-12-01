//
//  HomePresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol HomeView {
    
    func handleError(title: String, content: String)
    func reloadTableView()
}

protocol HomePresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getListFood(index:Int) -> [FoodDetailEntity]
    func getNumberOfListFood(index:Int) -> Int
    func getDataOfFood(index:Int, row:Int) -> FoodDetailEntity
    func getNameCategory(index:Int) -> String
    func presentFoodDetail(food:FoodDetailEntity)
    func addFoodToCart(food:FoodDetailEntity)
    func addSetToCart(set:SetDetailEntity)
    func presentSetDetail(set:SetDetailEntity)
    var numberOfListSet:Int {get}
    func getDataSet(row:Int) -> SetDetailEntity
}

class HomePresenterImplementation: HomePresenter {
    
    
    
    var listCategory:[CategoryDetailEntity] = []
    var listSetSuggest:[SetDetailEntity] = []
    
    //MARK: Injections
    private var view: HomeView?
    var router: HomeViewRouter
    var categoryGateway:CategoryGateway?
    var setGateway:SetGateway?
    //MARK: LifeCycle
    var numberOfList: Int{
        return listCategory.count
    }
    
    func getListFood(index: Int) -> [FoodDetailEntity] {
        return listCategory[index].foods
    }
    
    func getNumberOfListFood(index: Int) -> Int {
        if listCategory.count != 0 {
            return listCategory[index].foods.count
        }
        return 0
        
    }
    
    var numberOfListSet: Int{
        return listSetSuggest.count
    }
    
    func getDataSet(row: Int) -> SetDetailEntity {
        return listSetSuggest[row]
    }
    
    func getDataOfFood(index: Int, row: Int) -> FoodDetailEntity {
        return listCategory[index].foods[row]
    }
    
    func getNameCategory(index: Int) -> String {
        return listCategory[index].name
    }
    
    init(view: HomeView, router: HomeViewRouter,categoryGateway:CategoryGateway, setGateway: SetGateway) {
        self.view = view
        self.router = router
        self.categoryGateway = categoryGateway
        self.setGateway = setGateway
    }
    func viewDidLoad(){
        getCategory()
        getListSuggestSet()
    }
    
    func addFoodToCart(food: FoodDetailEntity) {
        FoodDetailEntity.addFoodToCart(food)
    }
    func addSetToCart(set: SetDetailEntity) {
        SetDetailEntity.addSetToCart(set)
    }
    
    func getCategory(){
        categoryGateway?.getCategory(completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    for category in data.data{
                        if category.name != "Các loại bệnh" && category.name != "Dinh Dưỡng"{
                            self.listCategory.append(category)
                        }
                    }
                    self.view?.reloadTableView()
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
    
    func getListSuggestSet(){
        setGateway?.getSetSuggest(completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    self.listSetSuggest = data.data
                    self.view?.reloadTableView()
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
    func presentFoodDetail(food:FoodDetailEntity){
        self.router.presentFoodDetail(food: food)
    }
    
    func presentSetDetail(set:SetDetailEntity) {
        
    }
}

// MARK: - HomePresenterInput

