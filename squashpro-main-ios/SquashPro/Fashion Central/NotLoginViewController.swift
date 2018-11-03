//
//  SignInViewController.swift
//  Central
//
//  Created by coder on 10/3/15.
//  Copyright © 2015 App Liaison. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore
import MobileCoreServices
import Cupcake

protocol LoginInCompletionPresentedViewControllerDelegate {
    func didFinishSigningIn()
}

class NotLoginViewController: BaseViewController, UIGestureRecognizerDelegate  {
    var ssaViewController: SSASideMenu?
    var signUpViewController: SignUpViewController?
    var onboardingViewController: OnboardingViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorPinkTwo
        self.navigationController?.navigationBar.isTranslucent = false
        // view.backgroundColor = Constants.Colors.colorPinkTwo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        title = Constants.MenuTitles.kTitleOne
        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: "presentLeftMenuViewController")
         */
		let leftImage = UIImage.fontAwesomeIcon(name: .bars, style: .regular, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
        let leftImageOriginal = leftImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImageOriginal, style: .plain, target: self, action: "presentLeftMenuViewController")
        
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.IconFontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        /*
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .Plain, target: self, action: "presentRightMenuViewController")
         */
        
		let rightImage = UIImage.fontAwesomeIcon(name: .slidersH, style: .regular, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
        let rightImageOriginal = rightImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImageOriginal, style: .plain, target: self, action: "presentRightMenuViewController")
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
        
    }
    
    override func setupUI() {
        //https://dribbble.com/shots/3346069-001-Log-in-Sing-up
        
        
        
        // let logo = Label.str("California Hair Works").color("#FC6560").font("30")
        let logo = Label.str("").color("white").font("24")
        
        let navStyle = Styles.color("darkGray").highColor("red").font(15)
        Styles("btn").color("#ffffff").highColor("white").highBg("#ffffff").font("15").padding(12, 30).border(3, "#fed35f").radius(-1)
        
        let pricing = Button.str("News").styles(navStyle).color("white")
        let docs = Button.str("Schedules").styles(navStyle).color("white")
        let demos = Button.str("Players").styles(navStyle).color("white")
        let blog = Button.str("Teams").styles(navStyle).color("white")
        let signIn = Button.str("Matchups").styles(navStyle).color("white")
        
        
        let nav = HStack(pricing, docs, demos, blog, signIn).gap(15)
        
        let simpleFast = Label.str("SquashPro").color("white").font("22").lines().align(.center)
        let upload = Label.str("Stay on top of your progress on the squash court. All boasting, no bragging.").color("white").font(20).lines(3).align(.center)
        
        let login = Button.str("Login").font(15).bg(Constants.Colors.colorPrintexOne).pin(44, .lowHugging).radius(4)
        let signup = Button.str("Register").font(15).bg(Constants.Colors.colorPrintexOne).pin(44, .lowHugging).radius(4)
        let tour = Button.str("How it works").font(15).bg(Constants.Colors.colorPrintexOne).pin(44, .lowHugging).radius(4)
        
        let image = ImageView.img("Icon").pin(.ratio)
        
        
        let items: [Any] = ["<-->", simpleFast, 15, image, 15, nav, 30, upload, 30, login, 30, signup, 30, tour, 30, "<-->"]
        // VStack(items).align(.center).embedIn(self.view, 10, 15, 0, 15)
        VStack(items).align(.center).embedIn(self.view, 10, 15, 90, 15)
        
        login.addTarget(self, action: #selector(NotLoginViewController.handleSignIn), for: .touchUpInside)
        signup.addTarget(self, action: #selector(NotLoginViewController.handleSignUp), for: .touchUpInside)
        tour.addTarget(self, action: #selector(NotLoginViewController.handleOnboarding), for: .touchUpInside)
        
        //---------------------------
        
    }
    
    func handleSignIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ssaViewController = storyboard.instantiateViewController(withIdentifier: "ssa") as? SSASideMenu
        self.present(ssaViewController!, animated: true, completion: nil)
    }
    
    func handleSignUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        self.present(signUpViewController!, animated: true, completion: nil)
    }
    
    func handleOnboarding() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        onboardingViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as? OnboardingViewController
        self.present(onboardingViewController!, animated: true, completion: nil)
    }
    //MARK: UIGestureRecognizerDelegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
