//
//  First.swift
//  CaliHairWorks
//
//  Created by coder on 3/28/18.
//  Copyright © 2018 App Liaison Inc. All rights reserved.
//

import UIKit
import Cupcake
import PinLayout
import EasyPeasy
import Firebase
import FirebaseAuth

class SecondViewController: BaseViewController, UITextFieldDelegate {
	var cardView: UIView!
	var titleLabel: UILabel!
	var fromPlayerLabel: UILabel!
	var fromPlayerTextField: UITextField!
	var fromPlayerTextFieldSeparator: UIView!
	var toPlayerLabel: UILabel!
	var toPlayerTextField: UITextField!
	var toPlayerTextFieldSeparator: UIView!
	var dateLabel: UILabel!
	var dateTextField: UITextField!
	var dateTextFieldSeparator: UIView!
	var loginButton: UIButton!
	var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorSquashZero
        self.navigationController?.navigationBar.isTranslucent = false
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.AssetNames.kAssetBackground)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        title = Constants.MenuTitles.kTitleTwo
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
        
    }
	
	@objc func dismissKeyboard() {
		self.view.endEditing(true)
	}
	
	override func setupUI() {
		var baselineVertical: Float = 32
		cardView = UIView()
		cardView.backgroundColor = UIColor.white
		cardView.layer.cornerRadius = 4.0
		
		view.addSubview(cardView)
		cardView.easy.layout(
			Width(320),
			Height(>=550),
			CenterX(0.0),
			CenterY(0.0)
		)
		
		
		// titleLabel
		self.titleLabel = UILabel(frame: CGRect.zero)
		self.titleLabel.text = "Schedule Matchup"
		self.titleLabel.textAlignment = .center
		self.titleLabel.font = UIFont(name: Constants.OnboardingFonts.openSansRegular, size: 17)
		self.titleLabel.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(titleLabel)
		self.titleLabel.easy.layout(
			Height(>=20),
			Top(10),
			Left(32),
			Right(32)
		)
		
		// usernameLabel
		fromPlayerLabel = UILabel(frame: CGRect.zero)
		self.fromPlayerLabel.text = "Player One"
		self.fromPlayerLabel.textAlignment = .left
		self.fromPlayerLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.fromPlayerLabel.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(fromPlayerLabel)
		self.fromPlayerLabel.easy.layout(
			Height(>=20),
			Top(62),
			Left(32)
		)
		
		// usernameTextField
		self.fromPlayerTextField = UITextField(frame: CGRect.zero)
		self.fromPlayerTextField.textAlignment = .left
		self.fromPlayerTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var fromPlayerTextFieldStringTitle = NSMutableAttributedString()
		let fromPlayerPlaceholderText = "Player one username"
		fromPlayerTextFieldStringTitle = NSMutableAttributedString(string:fromPlayerPlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.fromPlayerTextField.attributedPlaceholder = fromPlayerTextFieldStringTitle
		self.fromPlayerTextField.textColor = Constants.Colors.colorPrintexZero
		fromPlayerTextField.autocorrectionType = .no
		fromPlayerTextField.autocapitalizationType = .none
		self.cardView.addSubview(fromPlayerTextField)
		self.fromPlayerTextField.easy.layout(
			Height(>=20),
			Top(92),
			Left(32)
		)
		
		// usernameFieldSeparator
		fromPlayerTextFieldSeparator = UIView(frame: CGRect.zero)
		fromPlayerTextFieldSeparator.layer.borderWidth = 1.0
		fromPlayerTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(fromPlayerTextFieldSeparator)
		self.fromPlayerTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(122),
			Left(32),
			Right(32)
		)
		
		// emailLabel
		toPlayerLabel = UILabel(frame: CGRect.zero)
		self.toPlayerLabel.text = "Player Two"
		self.toPlayerLabel.textAlignment = .left
		self.toPlayerLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.toPlayerLabel.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(toPlayerLabel)
		self.toPlayerLabel.easy.layout(
			Height(>=20),
			Top(152),
			Left(32)
		)
		
		// emailTextField
		self.toPlayerTextField = UITextField(frame: CGRect.zero)
		self.toPlayerTextField.textAlignment = .left
		self.toPlayerTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var toPlayerTextFieldStringTitle = NSMutableAttributedString()
		let toPlayerPlaceholderText = "Player two username"
		toPlayerTextFieldStringTitle = NSMutableAttributedString(string:toPlayerPlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.toPlayerTextField.attributedPlaceholder = toPlayerTextFieldStringTitle
		self.toPlayerTextField.textColor = Constants.Colors.colorPrintexZero
		toPlayerTextField.autocorrectionType = .no
		toPlayerTextField.autocapitalizationType = .none
		self.cardView.addSubview(toPlayerTextField)
		self.toPlayerTextField.easy.layout(
			Height(>=20),
			Top(182),
			Left(32)
		)
		
		// emailFieldSeparator
		toPlayerTextFieldSeparator = UIView(frame: CGRect.zero)
		toPlayerTextFieldSeparator.layer.borderWidth = 1.0
		toPlayerTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(toPlayerTextFieldSeparator)
		self.toPlayerTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(212),
			Left(32),
			Right(32)
		)

		// dateLabel
		dateLabel = UILabel(frame: CGRect.zero)
		self.dateLabel.text = "Date"
		self.dateLabel.textAlignment = .left
		self.dateLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.dateLabel.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(dateLabel)
		self.dateLabel.easy.layout(
			Height(>=20),
			Top(242),
			Left(32)
		)
		
		// dateTextField
		self.dateTextField = UITextField(frame: CGRect.zero)
		self.dateTextField.textAlignment = .left
		self.dateTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var dateTextFieldStringTitle = NSMutableAttributedString()
		let datePlaceholderText = "Date of Match"
		dateTextFieldStringTitle = NSMutableAttributedString(string:datePlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.dateTextField.attributedPlaceholder = dateTextFieldStringTitle
		self.dateTextField.textColor = Constants.Colors.colorPrintexZero
		dateTextField.autocorrectionType = .no
		dateTextField.autocapitalizationType = .none
		self.cardView.addSubview(dateTextField)
		self.dateTextField.easy.layout(
			Height(>=20),
			Top(272),
			Left(32)
		)
		
		// dateTextFieldSeparator
		dateTextFieldSeparator = UIView(frame: CGRect.zero)
		dateTextFieldSeparator.layer.borderWidth = 1.0
		dateTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(dateTextFieldSeparator)
		self.dateTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(302),
			Left(32),
			Right(32)
		)
		
		// loginButton
		self.loginButton = UIButton(frame: CGRect.zero)
		self.loginButton.setTitle("ScehduleMatchup", for: .normal)
		self.loginButton.layer.cornerRadius = 4.0
		self.loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
		self.loginButton.setTitleColor(UIColor.white, for: .normal)
		self.loginButton.backgroundColor = Constants.Colors.colorPrintexOne
		self.cardView.addSubview(loginButton)
		self.loginButton.easy.layout(
			Height(40.0),
			Top(437),
			CenterX(0.0),
			Left(32),
			Right(32)
		)
		loginButton.addTarget(self, action: #selector(SecondViewController.scheduleMatchup), for: .touchUpInside)
		
		// cancelButton
		self.cancelButton = UIButton(frame: CGRect.zero)
		self.cancelButton.setTitle("Cancel", for: .normal)
		self.cancelButton.layer.cornerRadius = 4.0
		self.cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
		self.cancelButton.setTitleColor(UIColor.white, for: .normal)
		self.cancelButton.backgroundColor = Constants.Colors.colorPrintexOne
		self.cardView.addSubview(cancelButton)
		self.cancelButton.easy.layout(
			Height(40.0),
			Top(497),
			CenterX(0.0),
			Left(32),
			Right(32)
		)
		cancelButton.addTarget(self, action: #selector(SignUpViewController.handleCancel), for: .touchUpInside)
		
		// keyboardHandler
		self.fromPlayerTextField.delegate = self
		self.toPlayerTextField.delegate = self
		self.dateTextField.delegate = self
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
		view.addGestureRecognizer(tap)
	}
    func setupUIold() {
        //https://dribbble.com/shots/3346069-001-Log-in-Sing-up
        
        self.view.bg("#184367")
        
        let iphone5 = UIScreen.main.bounds.width == 320
        let card = View.bg("white").radius(4).embedIn(self.view, iphone5 ? 40 : "60", 30)
        
        let inputStyle = Styles.pin(40, .lowHugging).font(14)
        Styles("separator").bg("#C7C7CD").pin(1)
        
        let name = Label.str("From").font(17)
        let nameField = TextField.hint("Please enter your name").maxLength(15).styles(inputStyle)
        let line1 = View.styles("separator")
        
        let email = Label.str("To").font(17)
        let emailField = TextField.hint("Please enter opponent's name").keyboard(.emailAddress).styles(inputStyle)
        let line2 = View.styles("separator")
        
        let pw = Label.str("Proposed date and time").font(17)
        let pwField = TextField.hint("Date and time of match ").maxLength(10).secure().styles(inputStyle)
        let line3 = View.styles("separator")
        
        let statement = Label.str("☑️Please confirm that you have read the TracyCouture").color("lightGray").font(12)
        let term = Button.str( AttStr("Terms of service").color("#8DD6E5").font("12").underline() ).margin(0, -22)
        
        let login = Button.str("Send").font(15).bg(Constants.Colors.colorPrintexOne).pin(44, .lowHugging).radius(4)
        
        VStack(name, nameField, line1, 30, email, emailField, line2, 30,
               pw, pwField, line3, 30, statement , term, "<-->", login).embedIn(card, iphone5 ? 30: 50, 30, 30, 30)
        
        
        // Button.str("X").font(13).color("#D2E0E8").bg("#EDF2F5").radius(-1).pin(16, 16, .maxX(-10), .y(10)).addTo(card)
        // Button.str("HELP").font(13).padding(10).pin(.centerX(0), .maxY("-5")).addTo(self.view)
    }
	
	func scheduleMatchup() {

		
		
	}
	
	func handleCancel() {
		
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
