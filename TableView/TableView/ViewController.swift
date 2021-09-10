//
//  ViewController.swift
//  TableView
//
//  Created by cemal tüysüz on 10.09.2021.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["Turkey","Germany","Japan","Russia","Italia"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }
    // Path size
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Row Size
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    // Return cell (Like viewHolder)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row). : \(countries[indexPath.row])"
        return cell
    }

    // Select listener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Country : \(countries[indexPath.row])")
    }
    
    // This method is old.
    /*
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Delete Action
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            print("delete data : \(self.countries[indexPath.row])")
        })
        // Edit Action
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {(action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            print("Edit data : \(self.countries[indexPath.row])")
        })
        return [deleteAction,editAction]
    } */
    
    // This method is new
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (contextualAction,view,boolValue) in
            print("delete data : \(self.countries[indexPath.row])")
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit"){
            (contextualAction,view,boolValue) in
            print("edit data : \(self.countries[indexPath.row])")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
    }

}

