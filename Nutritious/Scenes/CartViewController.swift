//
//  CartViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController, CartView,UIGestureRecognizerDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var tbCart: UITableView!
    @IBOutlet var viewBalon: UIView!
    @IBOutlet weak var lbQuantity: UILabel!
    var typeHandlerQuantity:HandlerQuantity = .Food
    // MARK: Injections
    var presenter: CartPresenter!
    var configurator: CartConfigurable = CartConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    
    func setupTableview(){
        tbCart.delegate = self
        tbCart.dataSource = self
        tbCart.register(UINib(nibName:"CartFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "cartFoodTableViewCell")
    }
    
    func reloadTableView() {
        tbCart.reloadData()
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func removeQuantity(_ sender: Any) {
        if typeHandlerQuantity == .Food {
            if Int(lbQuantity.text ?? "0") == 1 {
                alertRemove()
            }else {
                presenter.removeFood()
            }
        }else {
            if Int(lbQuantity.text ?? "0") == 1 {
                alertRemove()
            }else {
                presenter.removeSet()
            }
        }

    }
    
    func setQuantity(quantity: Int) {
        lbQuantity.text = String(quantity)
    }
    
    @IBAction func addQuantity(_ sender: Any) {
        if typeHandlerQuantity == .Food {
            presenter.addFood()
        }else {
            presenter.addSet()
        }

    }
    
    @IBAction func checkout(_ sender: Any) {
        presenter.presentComplate()
        
    }
    func alertRemove(){
        let alert = UIAlertController(title: "Xoá", message: "Bạn có chắc chắn muốn xoá món/set ăn khỏi giỏ hàng?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.presenter.removeFood()
            self.viewBalon.isHidden = true
        }))
        alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func deleteCart(_ sender: Any) {
        let alert = UIAlertController(title: "Xoá", message: "Bạn có chắc chắn muốn xoá giỏ hàng?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.presenter.deleteCart()
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showViewBalon(quantity:Int){
        lbQuantity.text = String(quantity)
        viewBalon.isHidden = false
    }
    
    @IBAction func hiddentPopup(_ sender: Any) {
        viewBalon.isHidden = true
    }
    
    func handleError(title: String, content: String) {
        
    }
    
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter.numberOfSet()
        }else {
            return presenter.numberOfFood()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.white
        let title = UILabel()
        if section == 0 {
            title.text = "Danh sách Set ăn"
        }else {
            title.text = "Danh sách món ăn"
        }
        
        title.frame = CGRect(x: 30, y: -5, width: 300, height: 35)
        title.textColor = #colorLiteral(red: 0.2716201544, green: 0.7891679406, blue: 0.4793732166, alpha: 1)
        viewHeader.addSubview(title)
        
        return viewHeader
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartFoodTableViewCell") as! CartFoodTableViewCell
            cell.setData(data: presenter.getDataOfFood(row: indexPath.row))
            cell.clickDetail = {[weak self] in
                self?.presenter.presentFoodDetail(food: (self?.presenter.getDataOfFood(row: indexPath.row))!)
            }
            cell.popupBalon = {[weak self] in
                self?.typeHandlerQuantity = .Food
                self?.presenter.setQuantityFood(food: (self?.presenter.getDataOfFood(row: indexPath.row))!)
                self?.showViewBalon(quantity: self?.presenter.getDataOfFood(row: indexPath.row).quantity ?? 0)
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartFoodTableViewCell") as! CartFoodTableViewCell
            cell.setData(data: presenter.getDataOfSet(row: indexPath.row))
            cell.clickDetail = {[weak self] in
                self?.presenter.presentSetDetail(row: indexPath.row)
            }
            cell.popupBalon = {[weak self] in
                self?.typeHandlerQuantity = .Set
                self?.presenter.setQuantitySet(set: (self?.presenter.getDataOfSet(row: indexPath.row))!)
                self?.showViewBalon(quantity: self?.presenter.getDataOfSet(row: indexPath.row).quantity ?? 0)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
