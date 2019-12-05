//
//  ComplateViewController.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit
import Lottie
class ComplateViewController: BaseViewController, ComplateView {
    
    // MARK: Outlets
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfNote: UITextField!
    @IBOutlet weak var tbAddress: UITableView!
    @IBOutlet weak var heightTbAddress: NSLayoutConstraint!
    var listOrder:String?
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
        tbAddress.delegate = self
        tbAddress.dataSource = self
        tbAddress.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "addressTableViewCell")
    }
    @IBAction func showAddress(_ sender: Any) {
        heightTbAddress.constant = 200
    }
    
    @IBAction func hiddenTableView(_ sender: Any) {
        heightTbAddress.constant = 0
    }
    

    func getListOrder() -> String {
        return listOrder ?? ""
    }
    @IBAction func done(_ sender: Any) {
        presenter.complate(title: tfAddress.text ?? "", phone: tfPhone.text ?? "", notes: tfNote.text ?? "", listOrder: listOrder ?? "")
    }
    
    func handleError(title: String, content: String) {
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated:  )
    }
    
    func orderSuccess() {
        let animationView = AnimationView(name: "success")
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.contentMode = .scaleAspectFit
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        self.view.addSubview(animationView)
        animationView.play()
    }
    func setAddress(data:AddressDetailEntity){
        tfAddress.text = data.title
        tfPhone.text = data.phone
    }
    
    func reloadTableView(){
        tbAddress.reloadData()
    }
}

// MARK: - ComplatePresenterOutput
extension ComplateViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListAddress
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressTableViewCell") as! AddressTableViewCell
        cell.setData(data: presenter.getDataAddress(row: indexPath.row))
        cell.clickAddress = {[weak self] in
            self?.setAddress(data: (self?.presenter.getDataAddress(row: indexPath.row))!)
            self?.presenter.setDataAddress(row: indexPath.row)
            self?.heightTbAddress.constant = 0
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
