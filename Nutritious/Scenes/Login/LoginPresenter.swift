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
    func validateAndLogin(username:String, password:String)
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
    
    func validateAndLogin(username:String, password:String){
        if username == "" || password == ""{
            
        }else {
            login(username: username, password: password)
        }
        
    }
    
    func login(username:String, password:String){
        loginGateway?.login(username: username, password: password, completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    LoginEntity.saveToken(data.token)
                    self.addNotification()
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
    
    func addNotification(){
        if let fcmToken = FcmTokenEntity.getFcmToken(){
            loginGateway?.addNotification(fcmToken: fcmToken, completionHandler: { (result) in
                switch (result){
                case let .success(data):
                    if data.status == CodeResponse.success {
                    print("add notification success")
                    }else {
                        print("add notification error")
                    }
                    
                case let .failure(error):
                    
                    self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                }
            })
        }
    }
    
}

// MARK: - LoginPresenterInput

