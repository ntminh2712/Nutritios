//
//  LoginPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol LoginView {
    
    func handleError(title: String, content: String)
    
}

protocol LoginPresenter {
    func viewDidLoad()
}

class LoginPresenterImplementation: LoginPresenter {
    
    //MARK: Injections
    private var view: LoginView?
    var router: LoginViewRouter
    var loginGateway: LoginGateway?
    //MARK: LifeCycle

    init(view: LoginView, router: LoginViewRouter,loginGateway: LoginGateway) {
        self.view = view
        self.router = router
        self.loginGateway = loginGateway
    }
    func viewDidLoad(){
        
    }
    
    func login(username:String, password:String){
        loginGateway?.login(username: username, password: password, completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    LoginEntity.saveToken(data.token)
                    self.router.presentHome()
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
    
}

// MARK: - LoginPresenterInput

