//
//  CatViewController.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation
import UIKit

class CatViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var catInfo: CatData?
    
    override func viewDidLoad() {
        print("CatViewController was loaded!")
        nameLabel.text = catInfo?.name
        descriptionLabel.text = catInfo?.description
        
    }
    
    
    
}
