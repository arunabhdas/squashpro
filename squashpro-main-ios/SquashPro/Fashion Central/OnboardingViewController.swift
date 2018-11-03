//
//  OnboardingViewController.swift
//  TracyCouture
//
//  Created by coder on 3/28/18.
//  Copyright © 2018 App Liaison Inc. All rights reserved.
//

import UIKit
import paper_onboarding
import Cupcake
import PinLayout
class OnboardingViewController: BaseViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    @IBOutlet weak var getStartedButton: CSDKButton!
    var signInViewController: SignInViewController?
    var ssaViewController: SSASideMenu?
    var onboardingView: OnboardingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onboardingView = OnboardingView()
        self.onboardingView.dataSource = self
        self.onboardingView.translatesAutoresizingMaskIntoConstraints = false

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.onboardingView.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(self.onboardingView)
        
        
        // add constraints
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboardingView,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
        
        
        // self.getStartedButton.backgroundColor = Constants.Colors.colorZero
        self.getStartedButton.titleLabel!.font = UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)
        self.getStartedButton.layer.shadowOpacity = 0.55
        self.getStartedButton.layer.shadowRadius = 5.0
        self.getStartedButton.layer.shadowColor = Constants.Colors.colorTwoShadow.cgColor
        self.getStartedButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        self.getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.getStartedButton.addTarget(self, action: #selector(OnboardingViewController.getStartedButtonTapped), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.onboardingView.addSubview(self.getStartedButton)
        self.getStartedButton.pin.hCenter().bottom(90)
        self.getStartedButton.alpha = 1
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let items = [
            OnboardingItemInfo(informationImage: Asset.squashIcon.image,
                               title: Constants.OnboardingTitles.kTitleOne,
                               description: Constants.OnboardingDescriptions.kDescriptionOne,
                               pageIcon: Asset.wallet.image,
                               color: Constants.Colors.colorSquashGradient,
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: Constants.OnboardingFonts.titleFont, descriptionFont: Constants.OnboardingFonts.descriptionFont),
            
            OnboardingItemInfo(informationImage: Asset.wallet.image,
                               title: Constants.OnboardingTitles.kTitleTwo,
                               description: Constants.OnboardingDescriptions.kDescriptionTwo,
                               pageIcon: Asset.wallet.image,
                               color: Constants.Colors.colorSquashGradient,
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: Constants.OnboardingFonts.titleFont, descriptionFont: Constants.OnboardingFonts.descriptionFont),
            
            OnboardingItemInfo(informationImage: Asset.key.image,
                               title: Constants.OnboardingTitles.kTitleThree,
                               description: Constants.OnboardingDescriptions.kDescriptionThree,
                               pageIcon: Asset.key.image,
                               color: Constants.Colors.colorSquashGradient,
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: Constants.OnboardingFonts.titleFont, descriptionFont: Constants.OnboardingFonts.descriptionFont),
            
            OnboardingItemInfo(informationImage: Asset.wallet.image,
                               title: Constants.OnboardingTitles.kTitleFour,
                               description: Constants.OnboardingDescriptions.kDescriptionFour,
                               pageIcon: Asset.wallet.image,
                               color: Constants.Colors.colorSquashGradient,
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: Constants.OnboardingFonts.titleFont, descriptionFont: Constants.OnboardingFonts.descriptionFont),
            
            OnboardingItemInfo(informationImage: Asset.key.image,
                               title: Constants.OnboardingTitles.kTitleFive,
                               description: Constants.OnboardingDescriptions.kDescriptionFive,
                               pageIcon: Asset.key.image,
                               color: Constants.Colors.colorSquashGradient,
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: Constants.OnboardingFonts.titleFont, descriptionFont: Constants.OnboardingFonts.descriptionFont),
            
            ]
        
        return items[index]
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: PaperOnboardingDataSource
    func onboardingItemsCount() -> Int {
        return 5
    }
    

    
    // MARK: PaperOnboardingDelegate
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if (index == 3) {
            
            if (self.getStartedButton.alpha == 1) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
            
            
        }
    }
    
    
    func onboardingWillTransitonToLeaving() {
        print("------------will transition to leaving")
    }
    
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if (index == 4) {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
        
    
    }
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        if (index == 5) {
            print("------------")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func getStartedButtonTapped() {
        // validationLabel.hidden = true
        // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // UIViewController *ivc = [storyboard instantiateViewControllerWithIdentifier:@"signup"];
        // [(UINavigationController*)self.window.rootViewController presentViewController:ivc animated:NO completion:nil];
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // ssaViewController = storyboard.instantiateViewController(withIdentifier: "ssa") as? SSASideMenu
        // self.present(ssaViewController!, animated: true, completion: nil)
        signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
        self.present(signInViewController!, animated: true, completion: nil)
    }

}
