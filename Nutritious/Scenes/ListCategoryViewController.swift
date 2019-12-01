//
//  ListCategoryViewController.swift
//  Nutritious
//
//  Created by MinhNT-Mac on 11/30/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class ListCategoryViewController: BaseViewController, ListCategoryView {
    
    // MARK: Outlets
    @IBOutlet weak var tbListCategory: UITableView!
    @IBOutlet weak var smCategory: UISegmentedControl!
    @IBOutlet weak var sbListCategory: UISearchBar!
    @IBOutlet weak var heightSearchBar: NSLayoutConstraint!
    
    // MARK: Injections
    var presenter: ListCategoryPresenter!
    var configurator: ListCategoryConfigurable = ListCategoryConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tbListCategory.delegate = self
        tbListCategory.dataSource = self
    }
    
    func setupSearchBar(){
        sbListCategory.delegate = self
        sbListCategory.placeholder = "Nhập tên món ăn và set ăn"
    }
    
    func handleError(title: String, content: String) {
        
    }
    @IBAction func search(_ sender: Any) {
//        sender.isSelect = !sender.isSelect
//        if sender.isSeclected {
//            heightSearchBar.constant = 50
//        }else {
//            heightSearchBar.constant = 0
//        }
    }
    
    func reloadTableView() {
        tbListCategory.reloadData()
    }
    
}

// MARK: - ListCategoryPresenterOutput
extension ListCategoryViewController: UITableViewDataSource, UITableViewDelegate  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if smCategory.selectedSegmentIndex == 0 {
            return presenter.numberOfListFood
        }else {
            return presenter.numberOfListSet
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if smCategory.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell") as! FoodTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell") as! FoodTableViewCell
            return cell
        }
    }
    
}

// MARk: SearchBar deleagate
extension ListCategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(searchText: searchText)
    }
}
