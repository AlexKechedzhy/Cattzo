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

    
    var percsArray: [(name: String, value: Int)] = []
    
    var allCatsArray: [CatData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loadingBackground.isHidden = true
                self.loadingIndicator.isHidden = true
                self.tableView.reloadData()
                print("Table View has been updated")
            }
            for cat in 0..<allCatsArray.count {
                percsArray.append((name: allCatsArray[cat].name!, value: allCatsArray[cat].countPercs()))
            }
        }
    }
    
    var catManager = WebManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        catManager.delegate = self
        catManager.performRequest()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")   
        print("When view is loaded: \(allCatsArray.count)")
    }
    
    
    func didUpdateCat(_ catManager: WebManager, cat: [CatData]) {
        allCatsArray = cat
    }
}


//MARK: - UITableView methods
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Created numberOfRowsInSection ")
        return allCatsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let info = allCatsArray[indexPath.row]
        cell.nameLabel.text = info.name
        cell.originLabel.text = getFlag(country: info.country_code ?? "🇺🇦") //"🇺🇦"
        cell.lifespanLabel.text = "Lifespan: \(info.life_span!) years"
        cell.weightLabel.text = "Weight: \(info.weight!.imperial!) kg"
        cell.percNumber = percsArray[indexPath.row].value
        cell.characterLabel.text = info.temperament
        
        cell.collectionViewCellModel = CollectionViewCellModel(data: info)
        cell.collectionViewCellModel?.percNumber = cell.percNumber
        cell.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
        cell.collectionView.delegate = cell.collectionViewCellModel
        cell.collectionView.dataSource = cell.collectionViewCellModel
        
        if info.countPercs() == 0 {
            print (info.countPercs())
            cell.collectionHeightConstraint.constant = 0
            cell.collectionTopConstraint.constant = 0
        } else {
            cell.collectionHeightConstraint.constant = 70
            cell.collectionTopConstraint.constant = 8
        }
        
        cell.lifespanView.layer.cornerRadius = 15
        cell.weightView.layer.cornerRadius = 15
        cell.cellView.layer.cornerRadius = 15
        cell.originView.layer.cornerRadius = 20
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
