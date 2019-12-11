//
//  ComplatePresenter.swift
//  Nutritious
//
//  Created by MinhNT on 12/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ComplateView {
    
    func handleError(title: String, content: String)
    func orderSuccess()
    func reloadTableView()
}

protocol ComplatePresenter {
    func viewDidLoad()
    var numberOfListAddress:Int {get}
    func complate(title:String, phone:String, notes:String, listOrder:[OrderDetailEntity])
    func getDataAddress(row:Int)->AddressDetailEntity
    func setDataAddress(row:Int)
}

class ComplatePresenterImplementation: ComplatePresenter {
    
    //MARK: Injections
    private var view: ComplateView?
    var router: ComplateViewRouter
    var orderGateway:OrderGateway?
    var addressDetail:AddressDetailEntity?
    var numberOfListAddress: Int{
        return listAddress.count
    }
    
    var listAddress:[AddressDetailEntity] = []
    
    //MARK: LifeCycle
    
    func getDataAddress(row: Int)->AddressDetailEntity {
        return listAddress[row]
    }
    init(view: ComplateView, router: ComplateViewRouter,orderGateway:OrderGateway) {
        self.view = view
        self.router = router
        self.orderGateway = orderGateway
    }
    
    func setDataAddress(row: Int) {
        addressDetail = listAddress[row]
    }
    func viewDidLoad(){
        getAllAđress()
    }
    
    func complate(title:String, phone:String, notes:String, listOrder:[OrderDetailEntity]){
        
        if title == "" || phone == "" {
            self.view?.handleError(title: NSLocalizedString("Thông Báo", comment: ""), content: "Bạn cần phải nhập địa chỉ và số điện thoại để đặt hàng")
        }else {
            
            if title == addressDetail?.title && phone == addressDetail?.phone{
                order(addressId: addressDetail?.id ?? 0, listOrder: listOrder, notes: notes)
            }else {
                addAddress(title: title, phone: phone, notes: notes, listOrder:listOrder)
            }
            
        }
    }
    
    func order(addressId:Int, listOrder:[OrderDetailEntity],notes:String){
        LoadingHUDControl.sharedManager.showLoadingHud()
        orderGateway?.order(addressId: addressId, listOrder: listOrder, notes: notes, completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.created {
                    self.view?.orderSuccess()
                }else {
                    self.view?.handleError(title: "Error", content: data.message)
                }
                LoadingHUDControl.sharedManager.hideLoadingHud()
                break
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
            }
        })
    }
    
    func addAddress(title:String,phone:String,notes:String, listOrder:[OrderDetailEntity]){
        orderGateway?.addAddresss(title: title, content: "", phone: phone
            , completionHandler: { (result) in
                switch (result){
                case let .success(data):
                    if data.status == CodeResponse.created {
                        self.addressDetail = data.data
                        self.order(addressId: self.addressDetail?.id ?? 0, listOrder: listOrder, notes: notes)
                    }
                    break
                case let .failure(error):
                    self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                }
        })
        
    }
    
    func getAllAđress(){
        LoadingHUDControl.sharedManager.showLoadingHud() 
        orderGateway?.getAddress(completionHandler: { (result) in
            switch (result){
            case let .success(data):
                if data.status == CodeResponse.success {
                    self.listAddress = data.listAddress
                    self.view?.reloadTableView()
                }else {
                    self.view?.handleError(title: "Error", content: data.message)
                }
                LoadingHUDControl.sharedManager.hideLoadingHud()
                break
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
            }
        })
    }
    
    func presentExample(leaguesId: Int){
        //        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - ComplatePresenterInput

