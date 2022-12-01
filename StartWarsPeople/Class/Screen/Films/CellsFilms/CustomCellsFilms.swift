//
//  CustomCellsFilms.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

class CustomCellsFilms: UITableViewCell{
    
    
    @IBOutlet weak var titleLabelFilms: UILabel!
    @IBOutlet weak var directorLabelFilms: UILabel!
    @IBOutlet weak var releaseDateLabelFilms: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
