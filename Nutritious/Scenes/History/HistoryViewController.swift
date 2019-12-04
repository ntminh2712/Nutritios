//
//  HistoryViewController.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class HistoryViewController: BaseViewController, HistoryView {
    
    // MARK: Outlets
    @IBOutlet weak var tbDiscover: UITableView!
    
    // MARK: Injections
    var presenter: HistoryPresenter!
    var configurator: HistoryConfigurable = HistoryConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
    }
    
    
    func setupTableView(){
        tbDiscover.delegate = self
        tbDiscover.dataSource = self
        tbDiscover.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "historyTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableView() {
        tbDiscover.reloadData()
    }
}

// MARK: - HistoryPresenterOutput
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableViewCell") as! HistoryTableViewCell
        cell.setData(data: presenter.getItemOfList(row: indexPath.row))
        cell.openWeb = {[weak self] in
            guard let url = URL(string: (self?.presenter.getItemOfList(row: indexPath.row).url)!) else { return }
            UIApplication.shared.open(url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
