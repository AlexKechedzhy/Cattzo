//
//  parametersTableViewModel.swift
//  Cattzo
//
//  Created by Alex173 on 28.02.2022.
//

import Foundation
import UIKit

class ParametersTableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var parametersArray: [(value: Int?, name: String)] = []
    
    init(data: CatData?) {
        super.init()
        self.parametersArray = data?.getParametersArray() ?? [(value: 0, name: "error")]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parametersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterTableViewCell", for: indexPath) as! ParameterTableViewCell
        cell.parameterLabel.text = parametersArray[indexPath.row].name
        let level = parametersArray[indexPath.row].value ?? 0
        for i in (level + 1)...6 {
            cell.circlesStackView.viewWithTag(i)?.backgroundColor = .clear
        }
        if level == 0 {
            for i in 1...5 {
                cell.circlesStackView.viewWithTag(i)?.backgroundColor = .lightGray
            }
        }
        cell.parameterCellView.layer.cornerRadius = 10
        for i in 1...5 {
            cell.circlesStackView.viewWithTag(i)?.layer.cornerRadius = 10
        }
        
        return cell
    }
    
    
    
    
}
