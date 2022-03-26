//
//  CollectionViewCell.swift
//  Cattzo
//
//  Created by Alex173 on 10.02.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.contentView.layer.shadowOpacity = 0.3
        self.contentView.layer.shadowRadius = 2.0
    }


    
}
