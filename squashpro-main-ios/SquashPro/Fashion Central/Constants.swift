//
//  Constants.swift
//  Fashion Central
//
//

import UIKit
import Hue
struct Constants {
    struct Colors {
        static let colorZero:UIColor = UIColor(red:  241/255.0, green: 145/255.0, blue: 12/255.0, alpha: 100.0/100.0)
        static let colorRed:UIColor = UIColor(red:  229/255.0, green: 37/255.0, blue: 36/255.0, alpha: 100.0/100.0)
        static let colorPink:UIColor = UIColor(red:  191/255.0, green: 49/255.0, blue: 0/255.0, alpha: 100.0/100.0)
        
        static let colorPinkOne:UIColor = UIColor(red:  210/255.0, green: 40/255.0, blue: 51/255.0, alpha: 100.0/100.0)
        static let colorPinkTwo:UIColor = UIColor(red:  218/255.0, green: 48/255.0, blue: 59/255.0, alpha: 100.0/100.0)
        static let colorPinkThree:UIColor = UIColor(red:  226/255.0, green: 56/255.0, blue: 67/255.0, alpha: 100.0/100.0)
        static let colorPinkFour:UIColor = UIColor(red:  234/255.0, green: 64/255.0, blue: 75/255.0, alpha: 100.0/100.0)
        static let colorPinkFive:UIColor = UIColor(red:  242/255.0, green: 72/255.0, blue: 83/255.0, alpha: 100.0/100.0)
        static let colorPinkSix:UIColor = UIColor(red:  250/255.0, green: 80/255.0, blue: 91/255.0, alpha: 100.0/100.0)
		
		// #184367
		static let colorOptimusZero:UIColor = UIColor(red:  24/255.0, green: 67/255.0, blue: 103/255.0, alpha: 100.0/100.0)
		// #114B5F
		static let colorOptimusOne:UIColor = UIColor(red:  17/255.0, green: 75/255.0, blue: 95/255.0, alpha: 100.0/100.0)
		// #2274A5
		static let colorOptimusTwo:UIColor = UIColor(red:  34/255.0, green: 116/255.0, blue: 165/255.0, alpha: 100.0/100.0)
		// #0B465F
		static let colorOptimusThree:UIColor = UIColor(red:  11/255.0, green: 70/255.0, blue: 95/255.0, alpha: 80.0/100.0)
		
		// #184367
		static let colorOptimusFour:UIColor = UIColor(red:  24/255.0, green: 67/255.0, blue: 103/255.0, alpha: 80.0/100.0)
		
		// #8DD6E5
		static let colorOptimusFive:UIColor = UIColor(red:  141/255.0, green: 214/255.0, blue: 229/255.0, alpha: 80.0/100.0)
        
        static let colorFuchsia:UIColor = UIColor(red: 215/255.0, green: 51/255.0, blue: 65/255.0, alpha: 100.0/100.0)
        static let colorFuchsiaTwo:UIColor = UIColor(red: 188/255.0, green: 73/255.0, blue: 122/255.0, alpha: 100.0/100.0)
        static let colorPurple:UIColor = UIColor(red:  200/255.0, green: 66/255.0, blue: 95/255.0, alpha: 100.0/100.0)
        static let colorBlue:UIColor = UIColor(red:  192/255.0, green: 75/255.0, blue: 112/255.0, alpha: 100.0/100.0)
        static let colorGreen:UIColor = UIColor(red:  68/255.0, green: 179/255.0, blue: 128/255.0, alpha: 100.0/100.0)
        static let colorTwoShadow:UIColor = UIColor(red:  114/255.0, green: 169/255.0, blue: 210/255.0, alpha: 50.0/100.0)
        static let classyBlue:UIColor = UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00)
        static let classyGreen:UIColor = UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00)
        static let classyPurple:UIColor = UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00)
        
        static let colorPrintexZero:UIColor = UIColor(red: 75/255.0, green: 87/255.0, blue: 151/255.0, alpha: 1.00)
        static let colorPrintexOne:UIColor = UIColor(red: 96/255.0, green: 142/255.0, blue: 222/255.0, alpha: 1.00)
        
        static let colorPrintexGradientBackground:UIColor = UIColor(patternImage: UIImage(named: Constants.AssetNames.kAssetBackground)!)
        
        
        static let colorSquashZero:UIColor = UIColor(red: 134/255.0, green: 191/255.0, blue: 252/255.0, alpha: 1.00)
        static let colorSquashGradient:UIColor = UIColor(patternImage: UIImage(named: Constants.AssetNames.kAssetSquashBackground)!)
        
        static let colorsquashGradient = [colorSquashZero, classyPurple].gradient { gradient in
            gradient.locations = [0.25, 1.0]
            return gradient
        }
        

    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    struct FontProperties {
        static let kFontName = "Avenir Book"
        static let kFontSize: CGFloat = 21
    }
    struct IconFontProperties {
        static let kFontName = "fashioncentral"
        static let kFontSize: CGFloat = 21
    }
    
    
    struct OnboardingFonts {
		static let openSansRegular = "OpenSans-Regular"
        static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
    }
    
    struct MagicNumbers {
        static let kYOffset: CGFloat = -60.0
        static let kXBuffer: CGFloat = 40.0
        static let kYBuffer: CGFloat = 100.0
        static let kCardViewWidth: CGFloat = 200.0
        static let kCardViewHeight: CGFloat = 385.0
    }

    
    struct NumItems {
        static let leftMenuNumItems: CGFloat = 9
    }
    
    struct MenuTitles {
        static let kTitleOne = "News"
        static let kTitleTwo = "Schedule"
        static let kTitleThree = "Players"
        static let kTitleFour = "Teams"
        static let kTitleFive = "Matchups"
        static let kTitleSix = "Track"
        static let kTitleSeven = "Stats"
    }
    
    struct OnboardingTitles {
        static let kTitleOne = "News"
        static let kTitleTwo = "Schedule"
        static let kTitleThree = "Players"
        static let kTitleFour = "Teams"
        static let kTitleFive = "Matchups"
        static let kTitleSix = "Track"
        static let kTitleSeven = "More"
    }
	
	// AuthLabels
	struct AuthLabels {
		static let kAuthLabelUsername = "Email"
		static let kAuthPlaceholderLabelUsername = "Please enter your email"
		static let kAuthLabelPassword = "Password"
		static let kAuthPlaceholderLabelPassword = "Please enter your password"
		
	}
	
    struct Categories {
        static let kTitleNewArrivals = 0
        static let kTitleDresses = 1
        static let kTitleJackets = 2
        static let kTitleLace = 3
        static let kTitleProm = 4
        static let kTitleSilk = 5
        static let kTitleSkirts = 6
        static let kTitleTops = 7
        static let kTitleBridal = 8
    }
    struct Labels {
        static let kApplicationName = "Squash Pro"
    }
    struct Entities {
        static let kProductClass = "Product"
    }
    struct NotificationKeys {
        static let kLeftMenuNotificationKey = "LeftMenuNotificationKey"
    }
    
    struct AssetNames {
        static let kAssetBackgroundReverse = "ReverseBackground"
        static let kAssetSquashBackground = "SquashBackground"
        static let kAssetBackground = "Background"
        static let kAssetIcon = "Icon"
        static let kAssetKey = "Key"
        static let kAssetWallet = "Wallet"
        static let kAssetShoppingCart = "Shopping-cart"
        
        static let kAssetMenuActivity = "ic_menu_activity"
        static let kAssetMenuExchange = "ic_menu_exchange"
		static let kAssetBars = "bars"
		static let kAssetSliders = "sliders"
    }
    
    // Onboarding
    struct OnboardingDescriptions {
        static let kDescriptionOne = "Stay tuned to the latest news from your league"
        static let kDescriptionTwo = "Track the schedules for the games on the league roster"
        static let kDescriptionThree = "Check the latest player stats"
        static let kDescriptionFour = "Organize and coordinate matchups"
        static let kDescriptionFive = "Connect with pro athletes and get tips for improving your fitness"
        
    }

    
    // Home
    struct FirstViewController {
        
    }
    
    struct ThirdViewController {
        static let kBrowseTitle = ""
    }
    
    
    
    // Events
    struct FifthViewController {
        static let kLabelContact = "Request Matchup"
    }
	
	struct GlobalTitles {
		static let kGlobalLoginTitle = "Login"
		static let kGlobalRegisterTitle = "Sign Up"
		static let kGlobalLandingTitle = "Prime Real-Estate on the Blockchain"
		static let kGlobalAddNewCardTitle = "Add New Card"
		static let kGlobalAttachPic = "Attach Pic"
		static let kGlobalAddCard = "Add Card"
	}
	
}
