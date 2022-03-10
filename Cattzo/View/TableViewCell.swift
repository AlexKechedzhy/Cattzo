//
//  TableViewCell.swift
//  Cattzo
//
//  Created by Alex173 on 11.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var lifespanView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var originView: UIView!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionTopConstraint: NSLayoutConstraint!
    
    var collectionViewCellModel: CollectionViewCellModel?
    var catInfo: CatData?
    var percNumber: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyShadows(to: originView)
        applyShadows(to: weightView)
        applyShadows(to: lifespanView)
        applyShadows(to: cellView)
    }
 
    private func applyShadows<T:UIView>(to view: T) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 2.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
