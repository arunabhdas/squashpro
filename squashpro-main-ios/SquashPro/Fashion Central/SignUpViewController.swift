//
//  SignUpViewController.swift
//  Central
//
//  Created by coder on 10/3/15.
//  Copyright © 2015 App Liaison. All rights reserved.
//

import UIKit
import Cupcake
import EasyPeasy
import FontAwesome_swift
import Firebase
import FirebaseAuth

protocol SignUpCompletionPresentedViewControllerDelegate {
    func didFinishSigningUp(_ name: String)
}

class SignUpViewController: BaseViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    var ssaViewController: SSASideMenu?
	var cardView: UIView!
	var titleLabel: UILabel!
	var usernameLabel: UILabel!
	var usernameTextField: UITextField!
	var usernameTextFieldSeparator: UIView!
	var emailLabel: UILabel!
	var emailTextField: UITextField!
	var emailTextFieldSeparator: UIView!
	var passwordLabel: UILabel!
	var passwordTextField: UITextField!
	var passwordFieldSeparator: UIView!
	var confirmPasswordLabel: UILabel!
	var confirmPasswordTextField: UITextField!
	var confirmPasswordFieldSeparator: UIView!
	var tosLabel: UILabel!
	var tosButton: UIButton!
	var loginButton: UIButton!
	var cancelButton: UIButton!
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
		self.titleLabel.text = Constants.GlobalTitles.kGlobalRegisterTitle
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
		usernameLabel = UILabel(frame: CGRect.zero)
		self.usernameLabel.text = "Username"
		self.usernameLabel.textAlignment = .left
		self.usernameLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.usernameLabel.textColor = UIColor.white
		self.cardView.addSubview(usernameLabel)
		self.usernameLabel.easy.layout(
			Height(>=20),
			Top(32),
			Left(32)
		)
		
		// usernameTextField
		self.usernameTextField = UITextField(frame: CGRect.zero)
		self.usernameTextField.textAlignment = .left
		self.usernameTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var usernameTextFieldStringTitle = NSMutableAttributedString()
		let usernamePlaceholderText = "Please enter your username"
		usernameTextFieldStringTitle = NSMutableAttributedString(string:usernamePlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.usernameTextField.attributedPlaceholder = usernameTextFieldStringTitle
		self.usernameTextField.textColor = Constants.Colors.colorPrintexZero
		usernameTextField.autocorrectionType = .no
		usernameTextField.autocapitalizationType = .none
		self.cardView.addSubview(usernameTextField)
		self.usernameTextField.easy.layout(
			Height(>=20),
			Top(62),
			Left(32)
		)
		
		// usernameFieldSeparator
		usernameTextFieldSeparator = UIView(frame: CGRect.zero)
		usernameTextFieldSeparator.layer.borderWidth = 1.0
		usernameTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(usernameTextFieldSeparator)
		self.usernameTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(92),
			Left(32),
			Right(32)
		)
		
		// emailLabel
		emailLabel = UILabel(frame: CGRect.zero)
		self.emailLabel.text = "Email"
		self.emailLabel.textAlignment = .left
		self.emailLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.emailLabel.textColor = UIColor.white
		self.cardView.addSubview(emailLabel)
		self.emailLabel.easy.layout(
			Height(>=20),
			Top(122),
			Left(32)
		)
		
		// emailTextField
		self.emailTextField = UITextField(frame: CGRect.zero)
		self.emailTextField.textAlignment = .left
		self.emailTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		var emailTextFieldStringTitle = NSMutableAttributedString()
		let emailPlaceholderText = "Please enter your email"
		emailTextFieldStringTitle = NSMutableAttributedString(string:emailPlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.emailTextField.attributedPlaceholder = emailTextFieldStringTitle
		self.emailTextField.textColor = Constants.Colors.colorPrintexZero
		emailTextField.autocorrectionType = .no
		emailTextField.autocapitalizationType = .none
		self.cardView.addSubview(emailTextField)
		self.emailTextField.easy.layout(
			Height(>=20),
			Top(152),
			Left(32)
		)
		
		// emailFieldSeparator
		emailTextFieldSeparator = UIView(frame: CGRect.zero)
		emailTextFieldSeparator.layer.borderWidth = 1.0
		emailTextFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(emailTextFieldSeparator)
		self.emailTextFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(182),
			Left(32),
			Right(32)
		)
		
		// passwordLabel
		self.passwordLabel = UILabel(frame: CGRect.zero)
		self.passwordLabel.text = "Password"
		self.passwordLabel.textAlignment = .left
		self.passwordLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.passwordLabel.textColor = UIColor.white
		self.cardView.addSubview(passwordLabel)
		self.passwordLabel.easy.layout(
			Height(>=20),
			Top(212),
			Left(32)
		)
		
		// passwordTextField
		self.passwordTextField = UITextField(frame: CGRect.zero)
		self.passwordTextField.textAlignment = .left
		self.passwordTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		// var textFieldStringTitle = NSMutableAttributedString()
		let placeholderText = "Please enter your password"
		var textFieldStringTitle = NSMutableAttributedString(string:placeholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.passwordTextField.attributedPlaceholder = textFieldStringTitle
		self.passwordTextField.textColor = Constants.Colors.colorPrintexZero
		passwordTextField.autocorrectionType = .no
		passwordTextField.autocapitalizationType = .none
		passwordTextField.secure(true)
		self.cardView.addSubview(passwordTextField)
		self.passwordTextField.easy.layout(
			Height(>=20),
			Top(242),
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
			Top(272),
			Left(32),
			Right(32)
		)
		
		// confirmPasswordLabel
		self.confirmPasswordLabel = UILabel(frame: CGRect.zero)
		self.confirmPasswordLabel.text = "Confirm Password"
		self.confirmPasswordLabel.textAlignment = .left
		self.confirmPasswordLabel.font = UIFont(name: "OpenSans-Regular", size: 17)
		self.confirmPasswordLabel.textColor = UIColor.white
		self.cardView.addSubview(confirmPasswordLabel)
		self.confirmPasswordLabel.easy.layout(
			Height(>=20),
			Top(302),
			Left(32)
		)
		
		// confirmPasswordTextField
		self.confirmPasswordTextField = UITextField(frame: CGRect.zero)
		self.confirmPasswordTextField.textAlignment = .left
		self.confirmPasswordTextField.font = UIFont(name: "OpenSans-Regular", size: 17)
		// let confirmPasswordtextFieldStringTitle = NSMutableAttributedString()
		let confirmPasswordPlaceholderText = "Please confirm your password"
		let confirmPasswordTextFieldStringTitle = NSMutableAttributedString(string:confirmPasswordPlaceholderText, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0), NSForegroundColorAttributeName: UIColor.lightGray])
		self.confirmPasswordTextField.attributedPlaceholder = confirmPasswordTextFieldStringTitle
		self.confirmPasswordTextField.textColor = Constants.Colors.colorPrintexZero
		confirmPasswordTextField.autocorrectionType = .no
		confirmPasswordTextField.autocapitalizationType = .none
		confirmPasswordTextField.secure(true)
		self.cardView.addSubview(confirmPasswordTextField)
		self.confirmPasswordTextField.easy.layout(
			Height(>=20),
			Top(332),
			Left(32)
		)
		
		// confirmPasswordFieldSeparator
		self.confirmPasswordFieldSeparator = UIView(frame: CGRect.zero)
		self.confirmPasswordFieldSeparator.layer.borderWidth = 1.0
		self.confirmPasswordFieldSeparator.layer.borderColor = UIColor.lightGray.cgColor
		self.cardView.addSubview(confirmPasswordFieldSeparator)
		self.confirmPasswordFieldSeparator.easy.layout(
			Width(<=320),
			Height(1),
			Top(362),
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
			Top(392),
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
			Top(407),
			Left(32)
		)
		
		// loginButton
		self.loginButton = UIButton(frame: CGRect.zero)
		self.loginButton.setTitle("Register", for: .normal)
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
		loginButton.addTarget(self, action: #selector(SignUpViewController.handleSignUp), for: .touchUpInside)
		
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
		self.emailTextField.delegate = self
		self.passwordTextField.delegate = self
		self.confirmPasswordTextField.delegate = self
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
		view.addGestureRecognizer(tap)
	}

    
    func handleSignUp() {
		Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
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
    
    //MARK: UIGestureRecognizerDelegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
