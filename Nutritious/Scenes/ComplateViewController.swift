//
//  ComplateViewController.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class ComplateViewController: BaseViewController, ComplateView {
    
    // MARK: Outlets
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tbComplate: UITableView!
    
    // MARK: Injections
    var presenter: ComplatePresenter!
    var configurator: ComplateConfigurable = ComplateConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tbComplate.delegate = self
        tbComplate.dataSource = self
        
    }
    
    @IBAction func done(_ sender: Any) {
        
    }
    
    
    
    
    func handleError(title: String, content: String) {
        
    }
}

// MARK: - ComplatePresenterOutput
extension ComplateViewController: UITableViewDataSource, UITableViewDelegate  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
