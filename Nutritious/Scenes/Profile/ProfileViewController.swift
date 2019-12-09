//
//  ProfileViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, ProfileView {
    
    
    
    // MARK: Outlets
    @IBOutlet weak var lbNameTop: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    
    // MARK: Injections
    var presenter: ProfilePresenter!
    var configurator: ProfileConfigurable = ProfileConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }
    
    func setDataProfile(data: ProfileDetailEntity) {
        lbNameTop.text = data.name
        lbName.text = data.name
        lbUserName.text = data.username
        lbEmail.text = data.email
        lbPhone.text = data.phone
    }
    
    @IBAction func logout(_ sender: Any) {
        logout()
    }
    
    func logout(){
        let alert = UIAlertController(title: "Đăng xuất", message: "Bạn có chắc chắn muốn đăng xuất tài khoản hiện tại", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            LoginEntity.deleteToken()
            self.presenter.presentLogin()
        }))
        alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func openUpdateAccount(_ sender: Any) {
        guard let url = URL(string: "http://anlanhmanh.com/login") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func openAboutUs(_ sender: Any) {
        guard let url = URL(string: "http://anlanhmanh.com/about") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func openContactUs(_ sender: Any) {
        guard let url = URL(string: "http://anlanhmanh.com/contact") else { return }
        UIApplication.shared.open(url)
    }
    func handleError(title: String, content: String) {
        self.showAlertWithOnlyCancelAction(title:title,message:content,alertType:.alert,cancelTitle:"Ok",cancelActionHandler:nil)
    }
}
