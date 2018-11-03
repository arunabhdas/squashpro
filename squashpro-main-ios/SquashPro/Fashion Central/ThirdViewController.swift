//
//  ThirdViewController.swift
//  Fashion Central
//
//  Created by coder on 12/17/15.
//  Copyright © 2015 App Liaison Inc. All rights reserved.
//

import UIKit

class ThirdViewController: BaseThirdViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorSquashZero
        self.navigationController?.navigationBar.isTranslucent = false
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        title = Constants.MenuTitles.kTitleThree
        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: "presentLeftMenuViewController")
         */
        // let leftImage = UIImage.fontAwesomeIcon(name: .bars, style: .regular, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
		let leftImage = UIImage(named: Constants.AssetNames.kAssetBars)
		let leftImageOriginal = leftImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImageOriginal, style: .plain, target: self, action: "presentLeftMenuViewController")
        
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.IconFontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        /*
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .Plain, target: self, action: "presentRightMenuViewController")
         */
        
        // let rightImage = UIImage.fontAwesomeIcon(name: .slidersH, style: .regular, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
		let rightImage = UIImage(named: Constants.AssetNames.kAssetSliders)
		let rightImageOriginal = rightImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        // TODO : FIXME navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImageOriginal, style: .plain, target: self, action: "presentRightMenuViewController")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImageOriginal, style: .plain, target: self, action: "signOutTapped")
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        swipeableView.numberOfHistoryItem = UInt.max
        swipeableView.allowedDirection = Direction.All
        
        let rightBarButtonItemTitle = "Rewind"
        
        func updateRightBarButtonItem() {
            let historyLength = self.swipeableView.history.count
            let enabled = historyLength != 0
            self.navigationItem.rightBarButtonItem?.isEnabled = enabled
            if !enabled {
                self.navigationItem.rightBarButtonItem?.title = rightBarButtonItemTitle
                return
            }
            let suffix = " (\(historyLength))"
            self.navigationItem.rightBarButtonItem?.title = "\(rightBarButtonItemTitle)\(suffix)"
        }
        
        swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction)")
            updateRightBarButtonItem()
        }
        
        // ↺
        // let rightButton = UIBarButtonItem(title: rightBarButtonItemTitle, style: .plain, target: self, action: #selector(rightButtonClicked))
        // navigationItem.rightBarButtonItem = rightButton
        
        updateRightBarButtonItem()
    }
    
    // MARK: - Actions
    
    @objc func rightButtonClicked() {
        self.swipeableView.rewind()
        // updateRightBarButtonItem()
    }
    
}
