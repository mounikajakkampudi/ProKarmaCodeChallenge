//
//  DataTableViewController.swift
//  iOSChallenge
//
//  Created by Mounika Jakkampudi on 10/10/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {

    var dataViewModel = DataViewModel()
    var isDataLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.fetchChildrensList()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLodingViewAlert()
    }
    
    func setupTableView() {
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customTableCellResuseId)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        self.tableView.separatorStyle = .none
    }
    
    func fetchChildrensList() {
        self.dataViewModel.fetchChildrensList() { (result) in
                   switch result {
                   case .failure(let error) :
                       print(error.localizedDescription)
                   case .success(let success) :
                       if success {
                           DispatchQueue.main.async {
                            self.isDataLoaded = true
                            self.dismissAlert()
                            self.tableView.reloadData()
                           }
                       }
                   }
               }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataViewModel.getChildrenObjectCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableCellResuseId, for: indexPath) as! CustomTableViewCell
        cell.childrenDataObject = self.dataViewModel.getChildrenObjectAtIndex(index: indexPath.row)
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex && !self.dataViewModel.afterLink.isEmpty {
            self.fetchChildrensList()
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = !self.isDataLoaded
        }
    }

}
