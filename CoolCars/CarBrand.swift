//
//  CarBrand.swift
//  CoolCars
//
//  Created by Németh László Harri on 2019. 01. 16..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import Foundation
import UIKit

class CarBrand {
    private(set) var carBrandName : String = ""
    private(set) var carBrandImage : UIImage
    
    init(carBrandName : String, carBrandImageName : String) {
        self.carBrandName = carBrandName
        if carBrandImageName != "" {
            self.carBrandImage = UIImage(imageLiteralResourceName: carBrandImageName)
        } else {
            self.carBrandImage = UIImage.init()
        }
    }
}
