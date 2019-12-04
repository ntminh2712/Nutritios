//
//  HistoryPresenter.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol HistoryView {
    
    func handleError(title: String, content: String)
    func reloadTableView()
}

protocol HistoryPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> DiscoveryDetailEntity
}

class HistoryPresenterImplementation: HistoryPresenter {
    
    var listDiscovery:[DiscoveryDetailEntity] = []
    //MARK: Injections
    private var view: HistoryView?
    var router: HistoryViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    var numberOfList: Int {
        return listDiscovery.count
    }
    
    func getItemOfList(row: Int) -> DiscoveryDetailEntity {
        return listDiscovery[row]
    }
    init(view: HistoryView, router: HistoryViewRouter) {
        self.view = view
        self.router = router
    }
    func viewDidLoad(){
        mapListDiscovery()
    }
    
    func mapListDiscovery(){
       listDiscovery = loadJson(filename: "Demo") ?? []
    }
    
    func loadJson(filename fileName: String) -> [DiscoveryDetailEntity]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DiscoveryEntity.self, from: data)
                return jsonData.discover
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - HistoryPresenterInput

