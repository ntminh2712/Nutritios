//
//  ProfileViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, ProfileView {
    
    // MARK: Outlets
    
    // MARK: Injections
    var presenter: ProfilePresenter!
    var configurator: ProfileConfigurable = ProfileConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }
    func handleError(title: String, content: String) {
        
    }
}

// MARK: - ProfilePresenterOutput
//extension ProfileViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
