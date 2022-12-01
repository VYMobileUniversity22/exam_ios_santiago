//
//  CustomCellsFilms.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

class CustomCellsFilms: UITableViewCell {
    @IBOutlet var titleLabelFilms: UILabel!
    @IBOutlet var directorLabelFilms: UILabel!
    @IBOutlet var releaseDateLabelFilms: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
