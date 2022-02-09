//
//  CatViewController.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation
import UIKit

class CatViewController: UIViewController, CatManagerImageDelegate {

    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    var catInfo: CatData?
    var image: UIImage?
    var catManager = CatManager()
    
    override func viewDidLoad() {
        print("CatViewController was loaded!")
        nameLabel.text = catInfo?.name
        descriptionLabel.text = catInfo?.description
        catManager.imageDelegate = self
        loadImage()
        
    }
    
    func didLoadImage(_ catManager: CatManager, image: UIImage) {
        catImage.image = image
    }
    
    func loadImage() {
        if let image = catInfo?.image {
            if let url = catInfo?.image?.url {
                catManager.loadImages(url)
            } else {
                catImage.image = UIImage(named: "defaultCatImage")
            }
        } else {
            catImage.image = UIImage(named: "defaultCatImage")
        }
    }
    
}
