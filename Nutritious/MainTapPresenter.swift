//
//  MainTapPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol MainTapView {
    
    func handleError(title: String, content: String)
    
}

protocol MainTapPresenter {
    func viewDidLoad()
}

class MainTapPresenterImplementation: MainTapPresenter {
    
    //MARK: Injections
    private var view: MainTapView?
    var router: MainTapViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: MainTapView, router: MainTapViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - MainTapPresenterInput

