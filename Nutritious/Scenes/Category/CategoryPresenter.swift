//
//  CategoryPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol CategoryView {
    
    func handleError(title: String, content: String)
    func reloadCollectionView()
}

protocol CategoryPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getCategory(row:Int) -> CategoryDetailEntity
    func presentListCategory(row:Int)
}

class CategoryPresenterImplementation: CategoryPresenter {
    
    var listCategory:[CategoryDetailEntity] = []
    //MARK: Injections
    private var view: CategoryView?
    var router: CategoryViewRouter
    var categoryGateway:CategoryGateway?
//    var Gateway: Gateway?
    //MARK: LifeCycle

    var numberOfList: Int {
        return listCategory.count
    }
    
    func getCategory(row: Int) -> CategoryDetailEntity {
        return listCategory[row]
    }
    
    init(view: CategoryView, router: CategoryViewRouter, categoryGateway:CategoryGateway) {
        self.view = view
        self.router = router
        self.categoryGateway = categoryGateway
    }
    func viewDidLoad(){
         getCategory()
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
                    self.view?.reloadCollectionView()
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
    
    func presentListCategory(row: Int) {
        self.router.presentListCategory(category: listCategory[row])
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    
}

// MARK: - CategoryPresenterInput

