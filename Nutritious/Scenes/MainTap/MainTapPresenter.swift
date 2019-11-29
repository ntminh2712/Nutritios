//
//  MainTapPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol MainTapView {
    
    func handleError(title: String, content: String)
    
}

protocol MainTapPresenter {
    func viewDidLoad()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func presentHome()
    func presentCategory()
    func presentHistory()
    func presentProfile()
    func presentCart()
}

class MainTapPresenterImplementation: MainTapPresenter {
    
    //MARK: Injections
    private var view: MainTapView?
    var router: MainTapViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: MainTapView, router: MainTapViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        self.presentHome()
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.router.prepare(for: segue, sender: sender)
    }
    
    func presentHome() {
        self.router.presentHome()
    }
    
    func presentCategory() {
        self.router.presentCategory()
    }
    
    func presentHistory() {
        self.router.presentHistory()
    }
    
    func presentProfile() {
        self.router.presentProfile()
    }
    func presentCart() {
        self.router.presentCart()
    }
}

// MARK: - MainTapPresenterInput

