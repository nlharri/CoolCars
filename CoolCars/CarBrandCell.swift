//
//  CarBrandCell.swift
//  CoolCars
//
//  Created by Németh László Harri on 2019. 01. 15..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class CarBrandCell : UITableViewCell {
    
    @IBOutlet weak var carBrandLogoImage: UIImageView!
    @IBOutlet weak var carBrandCellOutlet: UILabel!
    
    func setBrandLogoImage(toImage : UIImage) {
        carBrandLogoImage.image = toImage
    }
}
