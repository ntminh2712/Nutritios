//
//  ComplatePresenter.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ComplateView {
    
    func handleError(title: String, content: String)
    
}

protocol ComplatePresenter {
    func viewDidLoad()
}

class ComplatePresenterImplementation: ComplatePresenter {
    
    //MARK: Injections
    private var view: ComplateView?
    var router: ComplateViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: ComplateView, router: ComplateViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - ComplatePresenterInput

