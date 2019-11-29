//
//  FoodDetailViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class FoodDetailViewController: BaseViewController, FoodDetailView {
    
    // MARK: Outlets
    @IBOutlet weak var clDetail: UICollectionView!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPriceWeight: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    
    // MARK: Injections
    var presenter: FoodDetailPresenter!
    var configurator: FoodDetailConfigurable = FoodDetailConfigurator()

    var food:FoodDetailEntity?
    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    func setData(){
        imgFood.setCustomImage(food?.image, defaultAvatar: "")
        lbName.text = food?.name
        lbPriceWeight.text = "\((food?.price.convertTypePrice())!)/\((food?.weight)!)g"
        tvDescription.text = food?._description
    }
    
    func setupCollectionView(){
        clDetail.delegate = self
        clDetail.dataSource = self
        clDetail.register(UINib(nibName: "MicronutrientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "micronutrientsCollectionViewCell")
        
    }
    func handleError(title: String, content: String) {
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - FoodDetailPresenterOutput
extension FoodDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "micronutrientsCollectionViewCell", for: indexPath) as! MicronutrientsCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.setData(indexPath: indexPath.row, weight: food?.calorie ?? 0.0)
        case 1:
            cell.setData(indexPath: indexPath.row, weight: food?.protein ?? 0.0)
        case 2:
            cell.setData(indexPath: indexPath.row, weight: food?.lipid ?? 0.0)
        case 3:
            cell.setData(indexPath: indexPath.row, weight: food?.canxi ?? 0.0)
        case 4:
            cell.setData(indexPath: indexPath.row, weight: food?.xenluloza ?? 0.0)
        case 5:
            cell.setData(indexPath: indexPath.row, weight: food?.iron ?? 0.0)
        case 6:
            cell.setData(indexPath: indexPath.row, weight: food?.carbonhydrates ?? 0.0)
        case 7:
            cell.setData(indexPath: indexPath.row, weight: food?.zinc ?? 0.0)
        case 8:
            cell.setData(indexPath: indexPath.row, weight: food?.vitaminA ?? 0.0)
        case 9:
            cell.setData(indexPath: indexPath.row, weight: food?.vitaminB ?? 0.0)
        case 10:
            cell.setData(indexPath: indexPath.row, weight: food?.vitaminC ?? 0.0)
        case 11:
            cell.setData(indexPath: indexPath.row, weight: food?.vitaminD ?? 0.0)
        case 12:
            cell.setData(indexPath: indexPath.row, weight: food?.vitaminE ?? 0.0)
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 60)
    }

}
