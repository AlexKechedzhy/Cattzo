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
    @IBOutlet weak var wikiButtonView: UIButton!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var loadingBackground: UIView!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var flagView: UIView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var temperamentView: UIView!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var lifespanView: UIView!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var parametersTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    
    
    var catInfo: CatData?
    var image: UIImage?
    var webManager = WebManager()
    var catViewModel = CatViewModel()
    var collectionViewCellModel: CollectionViewCellModel?
    var parametersTableViewModel: ParametersTableViewModel?

    
    override func viewDidLoad() {
        setupTableView()
        nameLabel.text = catInfo?.name
        descriptionLabel.text = catInfo?.description
        catImage.image = UIImage(named: "defaultCatImage")
        flagLabel.text = getFlag(country: catInfo?.country_code ?? "🇺🇦")
        temperamentLabel.text = catInfo?.temperament
        lifespanLabel.text = "Lifespan: \(catInfo?.life_span ?? "100") years"
        weightLabel.text = "Weight: \(catInfo?.weight?.imperial ?? "100") kg"
        createCells()
        updateElements()
        applyShadows()
        webManager.imageDelegate = self
        
        DispatchQueue.main.async {
            if let offlineImage = self.catViewModel.getSavedImage(named: self.catInfo!.id!){
                self.catImage.image = offlineImage
            } else {
                if let _ = self.catInfo?.image {
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
    
    @IBAction func wikiButton(_ sender: UIButton) {
        goToWiki(url: catInfo?.wikipedia_url)
    }
    
    func goToWiki(url: String?) {
        if let url = URL.init(string: url ?? "") {
            UIApplication.shared.open(url)
        } else {
            print ("Error while opening link.")
        }
    }
    
    func createCells() {
        collectionViewCellModel = CollectionViewCellModel(data: catInfo)
        collectionViewCellModel?.percNumber = catInfo?.countPercs()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = collectionViewCellModel
        collectionView.dataSource = collectionViewCellModel
        if collectionViewCellModel?.percNumber == 0 {
            collectionViewHeightConstraint.constant = 0
            collectionViewTopConstraint.constant = 0
        }
    }
    
    func setupTableView() {
        parametersTableViewModel = ParametersTableViewModel(data: catInfo)
        parametersTableView.register(UINib(nibName: "ParameterTableViewCell", bundle: nil), forCellReuseIdentifier: "ParameterTableViewCell")
        parametersTableView.delegate = parametersTableViewModel
        parametersTableView.dataSource = parametersTableViewModel
        
    }
    
    func updateElements() {
        flagView.layer.cornerRadius = 25
        temperamentView.layer.cornerRadius = 15
        descriptionView.layer.cornerRadius = 15
        weightView.layer.cornerRadius = 15
        lifespanView.layer.cornerRadius = 15
        wikiButtonView.layer.cornerRadius = 15
    }
    
    func applyShadows() {
        applyShadows(to: flagView)
        applyShadows(to: temperamentView)
        applyShadows(to: descriptionView)
        applyShadows(to: weightView)
        applyShadows(to: lifespanView)
        applyShadows(to: wikiButtonView)
    }
    
    private func applyShadows<T:UIView>(to view: T) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 2.0
    }
}
