//
//  ListCategoryPresenter.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 11/30/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ListCategoryView: class {
    
    func handleError(title: String, content: String)
    func reloadTableView()
}

protocol ListCategoryPresenter {
    func viewDidLoad()
    func search(searchText:String)
    var numberOfListFood:Int {get}
    var numberOfListSet:Int {get}
    func getDataFood(row:Int) ->FoodDetailEntity
    func getDataSet(row:Int) ->SetDetailEntity
}

class ListCategoryPresenterImplementation: ListCategoryPresenter {
    
    var listFood:[FoodDetailEntity] = []
    var listSet:[SetDetailEntity] = []
    
    var listFoodSearch:[FoodDetailEntity] = []
    var listSetSearch:[SetDetailEntity] = []
    
    var numberOfListSet: Int{
        return listSetSearch.count
    }
    var numberOfListFood: Int {
        return listFoodSearch.count
    }
    
    func getDataFood(row: Int) -> FoodDetailEntity {
        return listFoodSearch[row]
    }
    
    func getDataSet(row: Int) -> SetDetailEntity {
        return listSetSearch[row]
    }
    //MARK: Injections
    private weak var view: ListCategoryView?
    var router: ListCategoryViewRouter?
    //    var Gateway: Gateway?
    //MARK: LifeCycle
    init(view: ListCategoryView,router: ListCategoryViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad() {
        
    }
    
    func search(searchText:String){
        listFoodSearch = listFood.filter({ (food) -> Bool in
                if searchText.isEmpty { return true }
                return food.name.lowercased().contains(searchText.lowercased())
        })
        listSetSearch = listSet.filter({ (set) -> Bool in
            if searchText.isEmpty { return true }
            return set.name.lowercased().contains(searchText.lowercased())
        })
        self.view?.reloadTableView()
    }
    
    func presentExample(leaguesId: Int){
        //        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - ListCategoryPresenterInput

