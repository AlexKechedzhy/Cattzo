//
//  CatViewController.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation
import UIKit

class CatViewController: UIViewController, WebManagerImageDelegate {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var loadingBackground: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var catInfo: CatData?
    var image: UIImage?
    var webManager = WebManager()
    var catViewModel = CatViewModel()
    
    override func viewDidLoad() {
        nameLabel.text = catInfo?.name
        descriptionLabel.text = catInfo?.description
        catImage.image = UIImage(named: "defaultCatImage")
        webManager.imageDelegate = self
        
        DispatchQueue.main.async {
            if let offlineImage = self.catViewModel.getSavedImage(named: self.catInfo!.id!){
                self.catImage.image = offlineImage
            } else {
                if let image = self.catInfo?.image {
                    if let url = self.catInfo?.image?.url {
                        self.webManager.loadImages(url)
                    }
                }
            }
            self.loadingBackground.isHidden = true
            self.loadingIndicator.isHidden = true
        }
        
        
    }
    func didLoadImage(_ catManager: WebManager, image: UIImage) {
        print("didLoadImage delegate called!")
        catImage.image = image
        self.catViewModel.saveImage(image: image, id: catInfo!.id!)
    }
}
