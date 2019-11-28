//
//  HistoryViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class HistoryViewController: BaseViewController, HistoryView {
    
    // MARK: Outlets
    
    // MARK: Injections
    var presenter: HistoryPresenter!
    var configurator: HistoryConfigurable = HistoryConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }
    func handleError(title: String, content: String) {
        
    }
}

// MARK: - HistoryPresenterOutput
//extension HistoryViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
