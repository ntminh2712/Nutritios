//
//  LoginViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, LoginView {
    
    // MARK: Outlets
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    // MARK: Injections
    var presenter: LoginPresenter!
    var configurator: LoginConfigurable = LoginConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        btnLogin.setViewRadius()
    }
    
    func handleError(title: String, content: String) {
        
    }
    
    @IBAction func login(_ sender: Any) {
        presenter.validateAndLogin(username: tfUsername.text!, password: tfPassword.text!)
    }
}

// MARK: - LoginPresenterOutput
//extension LoginViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
