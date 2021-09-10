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

}

