//
//  SeventhViewController.swift
//  Fashion Central
//
//  Created by coder on 12/18/15.
//  Copyright © 2015 App Liaison Inc. All rights reserved.
//


import UIKit
import Cupcake

class SeventhViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorSquashZero
        self.navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = Constants.Colors.colorBlue
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        title = Constants.MenuTitles.kTitleSeven
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImageOriginal, style: .plain, target: self, action: "presentRightMenuViewController")
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        
    }
    override func setupUI() {
        //https://dribbble.com/shots/3441336-Mobile-dashboard-items-list-light-design
        
        let logo = ImageView.img(Constants.AssetNames.kAssetIcon)
        let profile = Button.img("customers")
        // let header = HStack(logo, "<-->", profile)
        // let header = HStack(logo)
        let headerImage = ImageView.img(Constants.AssetNames.kAssetIcon).pin(.ratio)
        
        let welcome = Label.str("Winter 2018 League Stats").font(18).color("white").lines(2)
        
        let number = Label.str("").font("AvenirNext-Bold,90").color("#181D42")
        let dash = View.pin(12, 3).bg("#DE2F43").radius(-1)
        
        // let jobsites = Label.str("Jobsites\nrequests").font(13).color("darkGray").lines(2)
        // let requests = HStack(number, 20, VStack(dash, 3, jobsites)).align(.baseline)
        
        // let jobBtn = DashButton("Cut and blowdry").img("arrow").str(58).color("white")
        let topLeftButton = DashButton("Teams").str(6).color("white")
        
        
        // let requestsBtn = DashButton("Blowdry or set").img("arrow").str(37).color("white")
        let topRightButton = DashButton("Players").str(24).color("white")
        // let customersBtn = DashButton("Colour").img("arrow").str(94).color("white")
        let bottomLeftButton = DashButton("Weeks").str(11).color("white")
        
        /*
         let entitiesBtn = DashButton("Perms").img("arrow").str(124).color("white").makeCons({
         $0.width.equal(jobBtn)
         $0.width.equal(requestsBtn)
         $0.width.equal(customersBtn)
         })
         */
        
        let bottomRightButton = DashButton("Matches").str(33).color("white").makeCons({
            $0.width.equal(topLeftButton)
            $0.width.equal(topRightButton)
            $0.width.equal(bottomLeftButton)
        })
        
        let tiles = View.margin(0, 10)
        // VStack(HStack(jobBtn, requestsBtn), HStack(customersBtn, entitiesBtn)).embedIn(tiles)
        VStack(HStack(topLeftButton, topRightButton), HStack(bottomLeftButton, bottomRightButton)).embedIn(tiles)
        
        // VStack(header, 30, welcome, 15, requests, 40, tiles).embedIn(self.view, 30, 30, 30)
        VStack(headerImage, 30, welcome, 55, tiles).embedIn(self.view, 30, 30, 30)
        
        let horLine = View.bg("white,0.4").pin(1).makeCons({
            $0.left.bottom.equal(topLeftButton)
            $0.width.equal(topLeftButton).multiply(2)
        })
        
        let verLine = View.bg("white,0.4").pin(.w(1)).makeCons({
            $0.top.right.equal(topLeftButton)
            $0.height.equal(topLeftButton).multiply(2)
        })
        
        self.view.addSubviews(horLine, verLine)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
