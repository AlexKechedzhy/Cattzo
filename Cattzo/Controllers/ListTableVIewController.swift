//
//  ViewController.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import UIKit

class ListTableViewController: UITableViewController, CatManagerDelegate {

    
    
    var allCatsArray: [CatData] = []
    var catManager = CatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.separatorStyle = .none
        tableView.rowHeight = 80.0
        catManager.delegate = self
        catManager.performRequest()
        print("When view is loaded: \(allCatsArray.count)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Created numberOfRowsInSection ")
        return allCatsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath)
        cell.textLabel?.text = allCatsArray[indexPath.row].name
        print("Created cellForRowAt")
        return cell

        
    }
    
    func loadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("Table View has been updated")
        }
    }
    
    func didUpdateCat(_ catManager: CatManager, cat: [CatData]) {
        allCatsArray = cat
        loadData()
    }

}
