//
//  HomeViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit
import ACTabScrollView
class HomeViewController: BaseViewController, HomeView {
    
    
    
    // MARK: Outlets
    @IBOutlet weak var tabScrollView: ACTabScrollView!
    @IBOutlet var viewFood: UIView!
    @IBOutlet weak var tbFood: UITableView!
    
    // MARK: Injections
    var presenter: HomePresenter!
    var configurator: HomeConfigurable = HomeConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupView()
        setupTableView()
        
    }
    
    func setupTableView(){
        tbFood.delegate = self
        tbFood.dataSource = self
    }
    
    func setupView(){
        tabScrollView.defaultPage = 1
        tabScrollView.tabSectionHeight = 60
        tabScrollView.pagingEnabled = true
        tabScrollView.cachedPageLimit = 3
        
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
    }

    func handleError(title: String, content: String) {
        
    }
}
extension HomeViewController: ACTabScrollViewDelegate,ACTabScrollViewDataSource {
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        let label = UILabel()
        label.text = "hello"
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        } else {
            label.font = UIFont.systemFont(ofSize: 20)
        }
        label.textColor = UIColor(red: 77.0 / 255, green: 79.0 / 255, blue: 84.0 / 255, alpha: 1)
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 36) // add some paddings
        
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return viewFood
    }
    
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return 10
    }
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        
    }
    
    
}
extension HomeViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
