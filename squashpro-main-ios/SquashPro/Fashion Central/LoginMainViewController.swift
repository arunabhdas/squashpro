//
//  LoginMainViewController.swift
//  SquashPro
//
//  Created by coder on 4/8/18.
//  Copyright © 2018 App Liaison Inc. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore
import MobileCoreServices
import Cupcake
import EasyPeasy
import Firebase
import FirebaseAuth

class LoginMainViewController: BaseViewController, UITextFieldDelegate {
    var ssaViewController: SSASideMenu?
	var cardView: UIView!
	var titleLabel: UILabel!
	var usernameLabel: UILabel!
	var usernameTextField: UITextField!
	var usernameTextFieldSeparator: UIView!
	var passwordLabel: UILabel!
	var passwordTextField: UITextField!
	var passwordFieldSeparator: UIView!
	var tosLabel: UILabel!
	var tosButton: UIButton!
	var loginButton: UIButton!
	var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
	@objc func dismissKeyboard() {
		self.view.endEditing(true)
	}
	override func setupUI() {
		
		cardView = UIView()
		cardView.backgroundColor = UIColor.white
		cardView.layer.cornerRadius = 4.0
		view.addSubview(cardView)
		cardView.easy.layout(
			Width(320),
			Height(>=480),
			CenterX(0.0),
			CenterY(0.0)
		)
		
		// titleLabel
		self.titleLabel = UILabel(frame: CGRect.zero)
		self.titleLabel.text = Constants.GlobalTitles.kGlobalLoginTitle
		self.titleLabel.textAlignment = .center
		self.titleLabel.font = UIFont(name: Constants.OnboardingFonts.openSansRegular, size: 17)
		self.titleLabel.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(titleLabel)
		self.titleLabel.easy.layout(
			Height(>=20),
			Top(36),
			Left(32),
			Right(32)
		)
		
		
		// usernameLabel
		usernameLabel = UILabel(frame: CGRect.zero)
		self.usernameLabel.text = Constants.AuthLabels.kAuthLabelUsername
		self.usernameLabel.textAlignment = .left
		self.usernameLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.usernameLabel.textColor = UIColor.white
		self.cardView.addSubview(usernameLabel)
		self.usernameLabel.easy.layout(
			Height(>=20),
			Top(72),
			Left(32)
		)
		
		// usernameTextField
		self.usernameTextField = UITextField(frame: CGRect.zero)
		self.usernameTextField.textAlignment = .left
		self.usernameTextField.autocapitalizationType = .none
		self.usernameTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var usernameTextFieldStringTitle = NSMutableAttributedString()
		let emailPlaceholderText = Constants.AuthLabels.kAuthPlaceholderLabelUsername
		usernameTextFieldStringTitle = NSMutableAttributedString(string:emailPlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.usernameTextField.attributedPlaceholder = usernameTextFieldStringTitle
		self.usernameTextField.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(usernameTextField)
		self.usernameTextField.easy.layout(
			Height(>=20),
			Top(102),
			Left(32)
		)
		
		// emailFieldSeparator
		usernameTextFieldSeparator = UIView(frame: CGRect.zero)
		usernameTextFieldSeparator.layer.borderWidth = 1.0
		usernameTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(usernameTextFieldSeparator)
		self.usernameTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(132),
			Left(32),
			Right(32)
		)
		
		// passwordLabel
		self.passwordLabel = UILabel(frame: CGRect.zero)
		self.passwordLabel.text = Constants.AuthLabels.kAuthLabelPassword
		self.passwordLabel.textAlignment = .left
		self.passwordLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.passwordLabel.textColor = UIColor.white
		self.cardView.addSubview(passwordLabel)
		self.passwordLabel.easy.layout(
			Height(>=20),
			Top(162),
			Left(32)
		)
		
		// passwordTextField
		self.passwordTextField = UITextField(frame: CGRect.zero)
		self.passwordTextField.textAlignment = .left
		self.passwordTextField.autocapitalizationType = .none
		self.passwordTextField.secure(true)
		self.passwordTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var textFieldStringTitle = NSMutableAttributedString()
		let placeholderText = Constants.AuthLabels.kAuthPlaceholderLabelPassword
		textFieldStringTitle = NSMutableAttributedString(string:placeholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.passwordTextField.attributedPlaceholder = textFieldStringTitle
		self.passwordTextField.textColor = Constants.Colors.colorPrintexZero
		self.cardView.addSubview(passwordTextField)
		self.passwordTextField.easy.layout(
			Height(>=20),
			Top(192),
			Left(32)
		)
		
		// passwordFieldSeparator
		self.passwordFieldSeparator = UIView(frame: CGRect.zero)
		self.passwordFieldSeparator.layer.borderWidth = 1.0
		self.passwordFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(passwordFieldSeparator)
		self.passwordFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(222),
			Left(32),
			Right(32)
		)
		
		// tosLabel
		self.tosLabel = UILabel(frame: CGRect.zero)
		self.tosLabel.text = "☑️Please confirm that you have read the"
		self.tosLabel.textAlignment = .left
		self.tosLabel.font = UIFont.systemFont(ofSize: 12.0)
		self.tosLabel.textColor = UIColor.white
		self.cardView.addSubview(tosLabel)
		self.tosLabel.easy.layout(
			Height(>=20),
			Top(252),
			Left(32)
		)
		
		// tosButton
		self.tosButton = UIButton(frame: CGRect.zero)
		self.tosButton.setTitle("terms of service", for: .normal)
		self.tosButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
		self.tosButton.setTitleColor(Constants.Colors.colorOptimusFive, for: .normal)
		self.cardView.addSubview(tosButton)
		self.tosButton.easy.layout(
			Height(>=20),
			Top(267),
			Left(32)
		)
		
		// loginButton
		self.loginButton = UIButton(frame: CGRect.zero)
		self.loginButton.setTitle("Login", for: .normal)
		self.loginButton.layer.cornerRadius = 4.0
		self.loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
		self.loginButton.setTitleColor(UIColor.white, for: .normal)
		self.loginButton.backgroundColor = Constants.Colors.colorPrintexOne
		self.cardView.addSubview(loginButton)
		self.loginButton.easy.layout(
			Height(40.0),
			Top(332),
			CenterX(0.0),
			Left(32),
			Right(32)
		)
		loginButton.addTarget(self, action: #selector(LoginMainViewController.handleSignIn), for: .touchUpInside)
		
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
			Top(412),
			CenterX(0.0),
			Left(32),
			Right(32)
		)
		cancelButton.addTarget(self, action: #selector(LoginMainViewController.handleCancel), for: .touchUpInside)
		
		// keyboardHandler
		self.usernameTextField.delegate = self
		self.passwordTextField.delegate = self
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
		view.addGestureRecognizer(tap)
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
    func handleSignIn() {
		Auth.auth().signIn(withEmail: self.usernameTextField.text!, password: self.passwordTextField.text!) { (user, error) in
			if (user != nil) {
				print("User has signed up")
				let storyboard = UIStoryboard(name: "Main", bundle: nil)
				self.ssaViewController = storyboard.instantiateViewController(withIdentifier: "ssa") as? SSASideMenu
				self.present(self.ssaViewController!, animated: true, completion: nil)
			}
			if (error != nil) {
				print(":(")
			}
		}
		
		

    }
    func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }

}
