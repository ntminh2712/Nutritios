//
//  CategoryViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, CategoryView {
    
    // MARK: Outlets
    @IBOutlet weak var clCategory: UICollectionView!
    
    // MARK: Injections
    var presenter: CategoryPresenter!
    var configurator: CategoryConfigurable = CategoryConfigurator()
    
    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        clCategory.delegate = self
        clCategory.dataSource = self
        clCategory.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCollectionViewCell")
        
    }
    
    func reloadCollectionView() {
        clCategory.reloadData()
    }
    
    func handleError(title: String, content: String) {
        self.showAlertWithOnlyCancelAction(title:title,message:content,alertType:.alert,cancelTitle:"Ok",cancelActionHandler:nil)
    }
}

// MARK: - CategoryPresenterOutput
//extension CategoryViewController: UITableViewDataSource, UITableViewDelegate  {
//
//}
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setData(data: presenter.getCategory(row: indexPath.row))
        cell.clickCategory = {[weak self] in
            self?.presenter.presentListCategory(row: indexPath.row)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.clCategory.frame.size.width / 2 , height: self.clCategory.frame.size.width / 2)
    }
    
}
