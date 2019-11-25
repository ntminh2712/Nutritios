//
//  MainTapSegmentController.swift
//  BaoVietOffice
//
//  Created by HOANPV on 10/10/18.
//  Copyright © 2018 Nava tech. All rights reserved.
//

import UIKit

class MainTapSegmentController: UIViewController {
    
    
    fileprivate weak var viewController : UIViewController!
    //Keeping track of containerViews
    fileprivate var containerViewObjects = Dictionary<String,UIViewController>()
    /** Pass in a tuple of required TimeInterval with UIViewAnimationOptions */
    var animationDurationWithOptions:(TimeInterval, UIView.AnimationOptions) = (0,[])
    
    /** Specifies which ever container view is on the front */
    open var currentViewController : UIViewController{
        get {
            return self.viewController
            
        }
    }
    
    
    fileprivate var segueIdentifier : String!
    
    /*Identifier For First Container SubView*/
    @IBInspectable internal var firstLinkedSubView : String!
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
    }
    open override func viewDidAppear(_ animated: Bool) {
        if let identifier = firstLinkedSubView{
            segueIdentifierReceivedFromParent(identifier)
        }
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(_ identifier: String, parrams: Any? = nil, nameParrams: String = ""){
        self.segueIdentifier = identifier
        self.performSegue(withIdentifier: self.segueIdentifier, sender: parrams)
        
    }
    
    
    
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            //Remove Container View
            if viewController != nil{
               if viewController.view != nil
                {
                    do
                    {
                        
                        try viewController.view.removeFromSuperview()
                    }
                    catch
                    {
                        
                    }
              
                }
                viewController = nil
                
            }
            //Add to dictionary if isn't already there
            if ((self.containerViewObjects[self.segueIdentifier] == nil)){
                viewController = segue.destination
                self.containerViewObjects[self.segueIdentifier] = viewController
               
//                viewController.sender
                
            }else{
                for (key, value) in self.containerViewObjects{
                    
                    if key == self.segueIdentifier{
                        viewController = value
                    }
                }
                
            }
            UIView.transition(with: self.view, duration: animationDurationWithOptions.0, options: animationDurationWithOptions.1, animations: {
                self.addChild(self.viewController)
                self.viewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
                self.viewController.prepare(for: segue, sender: sender)
                self.view.addSubview(self.viewController.view)
            }, completion: { (complete) in
                self.viewController.didMove(toParent: self)
            })
            
            
            
        }
        
    }
}
