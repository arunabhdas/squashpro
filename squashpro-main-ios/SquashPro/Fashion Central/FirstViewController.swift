//
//  SecondViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import UIKit
import Cupcake

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorSquashZero
        self.navigationController?.navigationBar.isTranslucent = false
        // view.backgroundColor = Constants.Colors.colorPrintexZero
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
      
        title = Constants.MenuTitles.kTitleOne
        /*
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: "presentLeftMenuViewController")
        */
		// let leftImage = UIImage.fontAwesomeIcon(name: .bars, style: .brands , textColor: UIColor.white, size: CGSize(width: 30, height: 30))
		let leftImage = UIImage(named: Constants.AssetNames.kAssetBars)
		let leftImageOriginal = leftImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImageOriginal, style: .plain, target: self, action: "presentLeftMenuViewController")
        
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.IconFontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        /*
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .Plain, target: self, action: "presentRightMenuViewController")
        */
        
		// let rightImage = UIImage.fontAwesomeIcon(name: .slidersH, style: .brands, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
		let rightImage = UIImage(named: Constants.AssetNames.kAssetSliders)
		let rightImageOriginal = rightImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImageOriginal, style: .plain, target: self, action: "signOutTapped")
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        
    }
    
    
    override func setupUI() {
        //https://dribbble.com/shots/3462307-Responsive-Shubox
        
        // let logo = Label.str("California Hair Works").color("#FC6560").font("30")
        let logo = Label.str(Constants.Labels.kApplicationName).color("white").font("24")
        
        let navStyle = Styles.color("darkGray").highColor("red").font(15)
        Styles("btn").color("#ffffff").highColor("white").highBg("#ffffff").font("15").padding(12, 30).border(3, "#ffffff").radius(-1)
        
        let pricing = Button.str("News").styles(navStyle).color("white")
        let docs = Button.str("Schedules").styles(navStyle).color("white")
        let demos = Button.str("Players").styles(navStyle).color("white")
        let blog = Button.str("Teams").styles(navStyle).color("white")
        let signIn = Button.str("Matchups").styles(navStyle).color("white")
    
        
        let nav = HStack(pricing, docs, demos, blog, signIn).gap(15)
        
        let simpleFast = Label.str("Ready Player One").color("white").font("22").lines().align(.center)
        let upload = Label.str("Use SquashPro to stay connected to your friendly neighbourhood squash league").color("white").font(15).lines(3).align(.center)
        
        let startTrial = Button.str("Schedule a match").styles("btn")
        let image = ImageView.img(Constants.AssetNames.kAssetIcon).pin(.ratio)
        
        
        let items: [Any] = [logo, 15, nav, 30, simpleFast, 15, upload, 30, startTrial, 30, image, "<-->"]
        VStack(items).align(.center).embedIn(self.view, 10, 15, 90, 15)
        
    }

    func signOutTapped() {
        let alert = UIAlertController(title: "Confirm Logout", message: "Are you sure?", preferredStyle: .actionSheet)
        // perhaps use action.title here
        
        
        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            //execute some code when this option is selected
        }))
        
        self.present(alert, animated: true) {
            //code to execute once the alert is showing
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
