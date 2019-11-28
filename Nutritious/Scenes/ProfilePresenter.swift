//
//  ProfilePresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ProfileView {
    
    func handleError(title: String, content: String)
    
}

protocol ProfilePresenter {
    func viewDidLoad()
}

class ProfilePresenterImplementation: ProfilePresenter {
    
    //MARK: Injections
    private var view: ProfileView?
    var router: ProfileViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: ProfileView, router: ProfileViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - ProfilePresenterInput

