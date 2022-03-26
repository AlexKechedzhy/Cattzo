//
//  CollectionViewCellModel.swift
//  Cattzo
//
//  Created by Alex173 on 12.02.2022.
//

import UIKit

class CollectionViewCellModel: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var breedInfo: CatData?
    var percNumber: Int?
    
    
    init(data: CatData?) {
        super.init()
        self.breedInfo = data
        self.percNumber = data?.countPercs()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return percNumber ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = getImage(percNumber: indexPath.item)
        cell.cellLabel.text = getLabel(percNumber: indexPath.item)
        cell.layer.cornerRadius = 10
        return cell
    }

    
    private func getImage(percNumber: Int) -> UIImage {
        let percArray = breedInfo?.getPercsArray()
        if let array = percArray {
            if let image = UIImage(named: array[percNumber].imageName) {
                return image
            }
            return UIImage(named: "defaultCatImage")!
        } else {
            return UIImage(named: "defaultCatImage")!
        }
    }
    
    private func getLabel(percNumber: Int) -> String {
        let percArray = breedInfo?.getPercsArray()
        return percArray![percNumber].labelName
    }
    

    
}
