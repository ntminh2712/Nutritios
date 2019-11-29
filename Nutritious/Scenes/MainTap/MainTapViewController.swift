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
    @IBOutlet weak var lbHome: UILabel!
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var imgHistory: UIImageView!
    @IBOutlet weak var lbHistory: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lbProfile: UILabel!
    
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
    @IBAction func presentHome(_ sender: Any) {
        presenter.presentHome()
        
    }
    @IBAction func presentCategory(_ sender: Any) {
        presenter.presentCategory()
    }
    
    @IBAction func presentHistory(_ sender: Any) {
        presenter.presentHistory()
    }
    @IBAction func presentProfile(_ sender: Any) {
        presenter.presentProfile()
    }
    func handleError(title: String, content: String) {
        
    }
    @IBAction func presentCart(_ sender: Any) {
        presenter.presentCart()
    }
}

// MARK: - MainTapPresenterOutput
//extension MainTapViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
