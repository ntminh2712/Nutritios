//
//  HistoryPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol HistoryView {
    
    func handleError(title: String, content: String)
    
}

protocol HistoryPresenter {
    func viewDidLoad()
}

class HistoryPresenterImplementation: HistoryPresenter {
    
    //MARK: Injections
    private var view: HistoryView?
    var router: HistoryViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: HistoryView, router: HistoryViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - HistoryPresenterInput

