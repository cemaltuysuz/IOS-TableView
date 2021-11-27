//
//  ViewController.swift
//  Nested TableView
//
//  Created by cemal tüysüz on 27.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var path = ["Fruits","Colors","Seasons"]
    var pathData = [["Apple","Banana","Strawberry"],["Red","Blue","Purple"],["Summer","Winter","Spring","Autumn"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return path.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return path[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pathData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell",for: indexPath)
        cell.textLabel?.text = pathData[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(path[indexPath.section]) - > \(pathData[indexPath.section][indexPath.row])")
    }
}

