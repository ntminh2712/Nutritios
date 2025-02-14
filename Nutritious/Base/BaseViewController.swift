//
//  BaseViewController.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import RxSwift
import KUIPopOver
class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        initInterface()
        initData()
        initNotification()
        validate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initInterface(){
       
        //TODO: abstract - do nothing
    }
    
    func initData(){
        //TODO: abstract - do nothing
    }
    
    
    func initNotification()
    {
        
    }
    
    func validate() {
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BaseViewController {
    func showAlertWith(title: String? = nil, message: String? = nil,
                       titleDefault: String? = nil, titleCancel: String? = nil,
                       handlerDefault: ((UIAlertAction) -> Swift.Void)? = nil,
                       handlerCancel: ((UIAlertAction) -> Swift.Void)? = nil) {
        // alert
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if let titleDefault = titleDefault {
            alertVC.addAction(UIAlertAction(title: titleDefault, style: UIAlertAction.Style.default, handler:handlerDefault))
        }
        if let titleCancel = titleCancel {
            alertVC.addAction(UIAlertAction(title: titleCancel, style: UIAlertAction.Style.cancel, handler:handlerCancel))
        }
        
        // present
        self.present(alertVC, animated: true, completion: nil)
    }
    func showAlertWithOnlyCancelAction(title: String? = nil, message: String? = nil,
                                       alertType: UIAlertController.Style, cancelTitle: String? = nil,
                                       cancelActionHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: alertType)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelActionHandler)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 170, height: 80))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.numberOfLines = 0
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

extension BaseViewController {
    func presentViewControllerProfile(identifier: String, main: String){
        DispatchQueue.main.async {
            let storyboard: UIStoryboard = UIStoryboard(name: main, bundle: nil)
            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: identifier)
            self.present(vc, animated: true, completion: nil)
        }
    }
    func pushViewController(identifier: String,main: String){
        let storyboard: UIStoryboard = UIStoryboard(name: main, bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class CustomPopOverView: UIView, KUIPopOverUsable {
    
    var contentSize: CGSize {
        return CGSize(width: 300.0, height: 400.0)
    }
    
    var popOverBackgroundColor: UIColor? {
        return .black
    }
    
    var arrowDirection: UIPopoverArrowDirection {
        return .up
    }

    init(frame: CGRect, view:UIView) {
        super.init(frame: frame)
        addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSubviews(view:UIView) {
        super.layoutSubviews()
        view.frame = self.bounds
    }
    
}
