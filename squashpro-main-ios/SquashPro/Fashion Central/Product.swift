//
//  Product.swift
//  Fashion Central
//
//  Created by coder on 12/19/15.
//  Copyright © 2015 App Liaison Inc. All rights reserved.
//

import UIKit

class Product: NSObject {
    var objectId: String?
    var productNumber: Int?
    var name: String?
    var desc: String?
    var mainImageFile: String?
    var smallImageFile: String?
    var mainImage: UIImage?
    init(objectId: String?, name: String?, desc: String?, mainImageFile: String?, smallImageFile: String?) {
        self.objectId = objectId
        self.name = name
        self.desc = desc
        self.mainImageFile = mainImageFile
        self.smallImageFile = smallImageFile
        // let placeholder = UIImage.fontAwesomeIconWithName(.CameraRetro, textColor: Constants.Colors.colorFuchsia, size: CGSizeMake(50, 50))
        // self.mainImage = placeholder
        
    }
}
