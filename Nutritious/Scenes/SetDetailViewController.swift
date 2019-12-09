//
//  SetDetailViewController.swift
//  Nutritious
//
//  Created by MinhNT on 12/2/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class SetDetailViewController: BaseViewController, SetDetailView {
    
    // MARK: Outlets
    
    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var clDetail: UICollectionView!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPriceWeight: UILabel!
    @IBOutlet weak var tbFood: UITableView!
    var setId:Int?
    // MARK: Injections
    var presenter: SetDetailPresenter!
    var configurator: SetDetailConfigurable = SetDetailConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad(setId:setId ?? 0)
        setupCollectionView()
        setupTableView()
    }
    
    func setupCollectionView(){
        clDetail.delegate = self
        clDetail.dataSource = self
        clDetail.register(UINib(nibName: "MicronutrientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "micronutrientsCollectionViewCell")
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setupTableView(){
        tbFood.delegate = self
        tbFood.dataSource = self
        tbFood.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodTableViewCell")
    }
    
    func setData(set:SetDetailEntity){
        imgSet.setCustomImage(set.image, defaultAvatar: "")
        lbName.text = set.name
        lbPriceWeight.text = "\(set.price.convertTypePrice())/\((set.weight))g"
        tvDescription.text = set._description
    }
    @IBAction func addToCart(_ sender: Any) {
        presenter.addSetToCart()
        self.showToast(message: "Thêm set ăn thành công")
    }
    func reloadData() {
        clDetail.reloadData()
        tbFood.reloadData()
    }
    func handleError(title: String, content: String) {
        self.showAlertWithOnlyCancelAction(title:title,message:content,alertType:.alert,cancelTitle:"Ok",cancelActionHandler:nil)
    }
}
extension SetDetailViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell") as! FoodTableViewCell
        cell.setData(data: presenter.getDataFood(row: indexPath.row))
        cell.clickFood = {[weak self] in
            self?.presenter.presentFoodDetail(row: indexPath.row)
        }
        cell.addToCart = {[weak self] in
            self?.presenter.addFoodToCart(row: indexPath.row)
            self?.showToast(message: "Thêm món ăn thành công")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
// MARK: - SetDetailPresenterOutput
extension SetDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "micronutrientsCollectionViewCell", for: indexPath) as! MicronutrientsCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.setData(indexPath: indexPath.row, weight: presenter.getDataSet()?.calorie ?? 0)
        case 1:
            cell.setData(indexPath: indexPath.row, weight: presenter.getDataSet()?.protein ?? 0.0)
        case 2:
            cell.setData(indexPath: indexPath.row, weight: presenter.getDataSet()?.lipid ?? 0.0)
        case 3:
            cell.setData(indexPath: indexPath.row, weight: presenter.getDataSet()?.canxi ?? 0.0)
        case 4:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.xenluloza ?? 0.0)
        case 5:
            cell.setData(indexPath: indexPath.row, weight: presenter.getDataSet()?.iron ?? 0.0)
        case 6:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.carbonhydrates ?? 0.0)
        case 7:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.zinc ?? 0.0)
        case 8:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.vitaminA ?? 0.0)
        case 9:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.vitaminB ?? 0.0)
        case 10:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.vitaminC ?? 0.0)
        case 11:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.vitaminD ?? 0.0)
        case 12:
            cell.setData(indexPath: indexPath.row, weight:  presenter.getDataSet()?.vitaminE ?? 0.0)
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 60)
    }
    
}
