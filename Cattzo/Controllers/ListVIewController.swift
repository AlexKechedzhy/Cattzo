//
//  ViewController.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import UIKit

class ListViewController: UIViewController, WebManagerDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingBackground: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var allCatsArray: [CatData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loadingBackground.isHidden = true
                self.loadingIndicator.isHidden = true
                self.tableView.reloadData()
                print("Table View has been updated")
            }
        }
    }
    
    var catManager = WebManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 80.0
        catManager.delegate = self
        catManager.performRequest()
        
        
        print("When view is loaded: \(allCatsArray.count)")
    }
    
    
    func didUpdateCat(_ catManager: WebManager, cat: [CatData]) {
        allCatsArray = cat
    }

}

//MARK: - UITableView methods
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Created numberOfRowsInSection ")
        return allCatsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath)
        cell.textLabel?.text = allCatsArray[indexPath.row].name
        print("Created cellForRowAt")
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate methods
extension ListViewController: UITableViewDelegate {
    // Performing action when the cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "catSegue", sender: self)

        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as! CatViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.catInfo = allCatsArray[indexPath.row]
            
        }
    }
}
