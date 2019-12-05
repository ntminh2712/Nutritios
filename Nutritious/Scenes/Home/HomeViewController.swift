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
    @IBOutlet weak var clCombo: UICollectionView!
    @IBOutlet weak var tbFood: UITableView!
    var currentPage:Int = 0
    let gestures = UISwipeGestureRecognizer()
    // MARK: Injections
    var presenter: HomePresenter!
    var configurator: HomeConfigurable = HomeConfigurator()
    
    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
        setupCollectionView()
        setupView()
        setupSwipeGesture()
    }
    
    func setupSwipeGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.tbFood.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.tbFood.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            if currentPage > 0 {
                tabScrollView.changePageToIndex(currentPage - 1, animated: true)
            }
            
        }
        else if gesture.direction == .left {
            if currentPage < tabScrollView.cachedPageLimit {
                tabScrollView.changePageToIndex( currentPage + 1, animated: true)
            }
        }
        tbFood.reloadData()
    }
    
    func setupTableView(){
        tbFood.delegate = self
        tbFood.dataSource = self
        tbFood.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodTableViewCell")
    }
    
    func setupCollectionView(){
        clCombo.delegate = self
        clCombo.dataSource = self
        clCombo.register(UINib(nibName: "SetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "setCollectionViewCell")
    }
    
    func setupView(){
        tabScrollView.tabSectionHeight = 50
        tabScrollView.pagingEnabled = true
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
        
    }
    
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableView() {
        
        tabScrollView.defaultPage = presenter.numberOfList / 2
        tabScrollView.cachedPageLimit = presenter.numberOfList
        tbFood.reloadData()
        tabScrollView.reloadData()
    }
}
extension HomeViewController: ACTabScrollViewDelegate,ACTabScrollViewDataSource {
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        let label = UILabel()
        label.text = presenter.getNameCategory(index: index)
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
        } else {
            label.font = UIFont.systemFont(ofSize: 25)
        }
        label.textColor = #colorLiteral(red: 0.2716201544, green: 0.7891679406, blue: 0.4793732166, alpha: 1)
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 36) // add some paddings
        
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        let view = UIView()
        return view
    }
    
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return presenter.numberOfList
    }
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        currentPage = index
        
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        currentPage = index
        tbFood.reloadData()
    }
    
    
}
extension HomeViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfListFood(index: currentPage)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell") as! FoodTableViewCell
        cell.setData(data: presenter.getDataOfFood(index: currentPage, row: indexPath.row))
        cell.clickFood = {[weak self] in
            self?.presenter.presentFoodDetail(food: (self?.presenter.getDataOfFood(index: self!.currentPage, row: indexPath.row))!)
        }
        cell.addToCart = {[weak self] in
            self?.presenter.addFoodToCart(food: (self?.presenter.getDataOfFood(index: self!.currentPage, row: indexPath.row))!)
            self?.showToast(message: "Thêm món ăn thành công")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfListSet
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "setCollectionViewCell", for: indexPath) as! SetCollectionViewCell
        cell.setData(set: presenter.getDataSet(row: indexPath.row))
        cell.addToCart = {[weak self] in
            self?.presenter.addSetToCart(set: (self?.presenter.getDataSet(row: indexPath.row))!)
        }
        cell.clickSet = {[weak self] in
            self?.presenter.presentSetDetail(row:indexPath.row)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
}

