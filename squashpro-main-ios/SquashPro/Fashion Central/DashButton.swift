//
//  DashButton.swift
//  SquashPro
//
//  Created by coder on 4/9/18.
//  Copyright © 2018 App Liaison Inc. All rights reserved.
//

import UIKit
import Cupcake
class DashButton: UIButton {
    let subtitle: String!
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        if state == .normal {
            let att = AttStr(
                AttStr(title).font("18").color("white"), "\n",
                AttStr(subtitle).font(11).color("white")
                ).lineGap(3).align(.center)
            self.str(att)
        } else {
            super.setTitle(title, for: state)
        }
    }
    
    init(_ subtitle: String) {
        self.subtitle = subtitle
        super.init(frame: CGRect.zero)
        self.pin(.lowHugging, 80).lines().gap(15).highBg("white,0.2")
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

