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
    
}

protocol HomePresenter {
    func viewDidLoad()
}

class HomePresenterImplementation: HomePresenter {
    
    //MARK: Injections
    private var view: HomeView?
    var router: HomeViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: HomeView, router: HomeViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - HomePresenterInput

