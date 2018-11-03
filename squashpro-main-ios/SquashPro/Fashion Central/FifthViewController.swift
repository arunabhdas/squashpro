//
//  FifthViewController.swift
//  Fashion Central
//
//  Created by coder on 12/18/15.
//  Copyright © 2015 App Liaison Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Cupcake
class FifthViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorSquashZero
        self.navigationController?.navigationBar.isTranslucent = false
        // view.backgroundColor = Constants.Colors.colorPinkTwo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        title = Constants.MenuTitles.kTitleFive
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
        //https://dribbble.com/shots/3346069-001-Log-in-Sing-up
        
        self.view.bg("#184367")
        
        let iphone5 = UIScreen.main.bounds.width == 320
        let card = View.bg("white").radius(4).embedIn(self.view, iphone5 ? 40 : "60", 30)
        
        let inputStyle = Styles.pin(40, .lowHugging).font(14)
        Styles("separator").bg("#C7C7CD").pin(1)
        
        let name = Label.str("NAME").font(17)
        let nameField = TextField.hint("Please enter your name").maxLength(15).styles(inputStyle)
        let line1 = View.styles("separator")
        
        let email = Label.str("E-MAIL").font(17)
        let emailField = TextField.hint("Please enter your email").keyboard(.emailAddress).styles(inputStyle)
        let line2 = View.styles("separator")
        
        let pw = Label.str("MESSAGE").font(17)
        let pwField = TextField.hint("Please enter message").maxLength(10).secure().styles(inputStyle)
        let line3 = View.styles("separator")
        
        let statement = Label.str("☑️  I agree all statements in").color("lightGray").font(12)
        let term = Button.str( AttStr("Terms of service").color("#8DD6E5").font("12").underline() ).margin(0, -22)
        
        let login = Button.str(Constants.FifthViewController.kLabelContact).font(15).bg(Constants.Colors.colorPrintexOne).pin(44, .lowHugging).radius(4)
        
        VStack(name, nameField, line1, 30, email, emailField, line2, 30,
               pw, pwField, line3, 30, statement , term, "<-->", login).embedIn(card, iphone5 ? 30: 50, 30, 30, 30)
        
        
        // Button.str("X").font(13).color("#D2E0E8").bg("#EDF2F5").radius(-1).pin(16, 16, .maxX(-10), .y(10)).addTo(card)
        // Button.str("HELP").font(13).padding(10).pin(.centerX(0), .maxY("-5")).addTo(self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
