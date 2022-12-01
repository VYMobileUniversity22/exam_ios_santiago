//
//  CustomCellsPeoples.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

class CustomCellsPeoples: UICollectionViewCell{
    
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
