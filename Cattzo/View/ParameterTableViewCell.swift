//
//  ParameterTableViewCell.swift
//  Cattzo
//
//  Created by Alex173 on 28.02.2022.
//

import Foundation
import UIKit

class ParameterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parameterLabel: UILabel!
    
    @IBOutlet weak var circleOne: UIView!
    @IBOutlet weak var circleTwo: UIView!
    @IBOutlet weak var circleThree: UIView!
    @IBOutlet weak var circleFour: UIView!
    @IBOutlet weak var circleFive: UIView!
    @IBOutlet weak var circlesStackView: UIStackView!
    
    @IBOutlet weak var parameterCellView: UIView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var numberView: UIView!
    
    override func awakeFromNib() {
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.contentView.layer.shadowOpacity = 0.3
        self.contentView.layer.shadowRadius = 2.0
    }
    

    
    
}
