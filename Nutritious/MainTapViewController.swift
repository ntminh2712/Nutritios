//
//  MainTapViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class MainTapViewController: BaseViewController, MainTapView {
    
    // MARK: Outlets
    
    // MARK: Injections
    var presenter: MainTapPresenter!
    var configurator: MainTapConfigurable = MainTapConfigurator()
    var contain: MainTapSegmentController!
    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contain"
        {
            self.configurator.configure(viewController: self)
        }
        presenter.prepare(for: segue, sender: sender)
        
    }
    func handleError(title: String, content: String) {
        
    }
}

// MARK: - MainTapPresenterOutput
//extension MainTapViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
