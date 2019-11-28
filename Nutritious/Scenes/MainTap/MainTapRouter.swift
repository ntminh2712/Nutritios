//
//  MainTapRouter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol MainTapViewRouter{
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func presentHome()
    func presentCategory()
    func presentHistory()
    func presentProfile()
}

class MainTapRouterImplemetation : MainTapViewRouter{
    
    
    
    // MARK: Injections
    weak var viewController: MainTapViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController as! MainTapViewController
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contain"
        {
            self.viewController?.contain = segue.destination as? MainTapSegmentController
        }
    }
    
    func presentHome() {
        self.viewController?.contain.segueIdentifierReceivedFromParent(SegueIdentifier.HomeView)
    }
    
    func presentCategory() {
        self.viewController?.contain.segueIdentifierReceivedFromParent(SegueIdentifier.CategoryView)
    }
    
    func presentHistory() {
        self.viewController?.contain.segueIdentifierReceivedFromParent(SegueIdentifier.HistoryView)
    }
    
    func presentProfile() {
        self.viewController?.contain.segueIdentifierReceivedFromParent(SegueIdentifier.ProfileView)
    }
}


