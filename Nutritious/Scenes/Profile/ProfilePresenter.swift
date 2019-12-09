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
    func setDataProfile(data:ProfileDetailEntity)
}

protocol ProfilePresenter {
    func viewDidLoad()
    func presentLogin()
}

class ProfilePresenterImplementation: ProfilePresenter {
    
    //MARK: Injections
    private var view: ProfileView?
    var router: ProfileViewRouter
    var loginGateway:LoginGateway?
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: ProfileView, router: ProfileViewRouter,loginGateway:LoginGateway) {
        self.view = view
        self.router = router
        self.loginGateway = loginGateway
    }
    func viewDidLoad(){
        getMe()
    }
    
    func getMe(){
        loginGateway?.getProfile(completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    self.view?.setDataProfile(data: data.data!)
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
    func presentLogin(){
        self.router.presentLogin()
    }
}

// MARK: - ProfilePresenterInput

