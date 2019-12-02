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
    var categoryList:CategoryDetailEntity?
    // MARK: Injections
    var presenter: ListCategoryPresenter!
    var configurator: ListCategoryConfigurable = ListCategoryConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
        setupSearchBar()
        self.presenter.setDataList(category: self.categoryList!)
    }
    
    func setupTableView(){
        tbListCategory.delegate = self
        tbListCategory.dataSource = self
        tbListCategory.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodTableViewCell")
    }
    
    func setupSearchBar(){
        sbListCategory.delegate = self
        sbListCategory.placeholder = "Nhập tên món ăn và set ăn"
    }
    
    func handleError(title: String, content: String) {
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func reloadTableView() {
        tbListCategory.reloadData()
    }
    @IBAction func chooseSegment(_ sender: Any) {
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
            cell.setData(data: self.presenter.getDataFood(row: indexPath.row))
            cell.addToCart = {[weak self] in
                self?.presenter.addFoodToCart(row: indexPath.row)
                self?.showToast(message: "Add food success")
            }
            cell.clickFood = {[weak self] in
                self?.presenter.presentFoodDetail(row: indexPath.row)
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell") as! FoodTableViewCell
            cell.setData(data: self.presenter.getDataSet(row: indexPath.row))
            cell.addToCart = {[weak self] in
                self?.presenter.addSetToCart(row: indexPath.row)
                self?.showToast(message: "Add set success")
            }
            cell.clickFood = {[weak self] in
                self?.presenter.presentSetDetail(row: indexPath.row)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

// MARk: SearchBar deleagate
extension ListCategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(searchText: searchText)
    }
}
