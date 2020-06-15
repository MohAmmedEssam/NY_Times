//
//  MainView.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/14/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    let tableView = UITableView()
    let vm = MainViewVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addTableView()
        self.addTableDelegates()
        self.getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addTitle()
    }
    //MARK:- add title
    func addTitle(){
        self.navigationItem.title = "NY Times Most Popular"
    }

    //MARK:- add table subview
    func addTableView(){
        self.view.addSubview(tableView)
        self.tableView.centerXAnchor.constraint(equalTo:  self.view.centerXAnchor).isActive = true
        self.tableView.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor).isActive = true

        self.tableView.widthAnchor.constraint(equalTo:  self.view.widthAnchor, multiplier: 1).isActive = true
        self.tableView.heightAnchor.constraint(equalTo:  self.view.heightAnchor, multiplier: 1).isActive = true
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK:- add table delegates
    func addTableDelegates(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MainViewCell", bundle: nil), forCellReuseIdentifier: "MainViewCell")
    }
    //MARK:- get data
    func getData(){
        vm.getMostPopular(){
            self.tableView.reloadData()
        }
    }

}
//MARK:- manage table dataSource
extension MainView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.data?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell", for: indexPath) as! MainViewCell
        let result = vm.data?.results?[indexPath.row]
        cell.cellManagment(result!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVC()
        vc.data = vm.data?.results?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
