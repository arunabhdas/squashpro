//
//  DetailViewController.swift
//  Central
//
//  Created by coder on 10/15/15.
//  Copyright © 2015 App Liaison. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate  {
    var urls: [String] = []
    var captionLabel: UILabel!
    var doneButton: CSDKButton!
    var currentMainImage: UIImage?
    var currentName: String?
    var currentUsername: String?
    var currentProductObjectId: String?
    /* var targetUser: PFUser? */
    // var fullScreenDetailViewController: FullScreenDetailViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStaticViews()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Constants.Colors.colorPrintexZero
        
        
        let panGestureRecognizer = UIPanGestureRecognizer()
        self.view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.delegate = self
        
        // 1
        let firstRowImageView               = UIImageView()
        firstRowImageView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        firstRowImageView.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        firstRowImageView.image = UIImage(named: "default")
        firstRowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // 2
        let secondRowImageView = UIImageView()
        secondRowImageView.heightAnchor.constraint(equalToConstant: 360.0).isActive = true
        secondRowImageView.widthAnchor.constraint(equalToConstant: 360.0).isActive = true
        secondRowImageView.clipsToBounds = true
        secondRowImageView.contentMode = UIViewContentMode.scaleAspectFit
		let placeholder = UIImage.fontAwesomeIcon(name: .cameraRetro, style: .regular, textColor: Constants.Colors.colorRed, size: CGSize(width: 300, height: 300))
        // secondRowImageView.image = placeholder
        secondRowImageView.translatesAutoresizingMaskIntoConstraints = false
        if (self.currentMainImage != nil) {
            print("currentMainImage not nil")
            secondRowImageView.image = self.currentMainImage
        } else {
            print("currentMainImage nil")
            secondRowImageView.image = placeholder
        }
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(DetailViewController.imageTapped(_:)))
        secondRowImageView.isUserInteractionEnabled = true
        secondRowImageView.addGestureRecognizer(tapGestureRecognizer)
        
        // 3
        captionLabel = UILabel()
        captionLabel.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        captionLabel.heightAnchor.constraint(equalToConstant: 37.5).isActive = true
       
        print("Current Name\(currentProductObjectId)")
        
        if (currentName != nil) {
            captionLabel.text = currentName
        } else {
            captionLabel.text = "_"
        }
        
        captionLabel.font = UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)
        captionLabel.textColor = UIColor.white
        captionLabel.textAlignment = .center
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 6
        doneButton = CSDKButton()
        doneButton.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 37.5).isActive = true
        doneButton.setTitle("Buy", for: UIControlState())
        doneButton.backgroundColor = Constants.Colors.colorPink
        doneButton.layer.shadowOpacity = 0.55
        doneButton.layer.shadowRadius = 5.0
        // doneButton.layer.shadowColor = colorTwoShadow.CGColor
        doneButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(DetailViewController.doneButtonTapped), for: .touchUpInside)
        
        
        let stackView   = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.vertical
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.spacing   = 10.0
        
        
        stackView.addArrangedSubview(firstRowImageView)
        stackView.addArrangedSubview(secondRowImageView)
        stackView.addArrangedSubview(captionLabel)
        stackView.addArrangedSubview(doneButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let constraint = NSLayoutConstraint(
            item: stackView,
            attribute: .top,
            relatedBy: .equal,
            toItem: topLayoutGuide,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 10.0
        )
        self.view.addConstraint(constraint)
        
        

    }
    
    /*
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
    }
    */
    
    func imageTapped(_ img: AnyObject) {
        print("imageTapped")
       /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.performSegueWithIdentifier("DetailToFullScreenDetailSegue", sender: self)
        */
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if (segue.identifier == "DetailToFullScreenDetailSegue") {
            
            // let detailVC =  segue.destinationViewController as! FullScreenDetailViewController
            // detailVC.currentImage = self.currentImage
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shareButtonTapped() {
        /*
        if let user = PFUser.currentUser()  {
            
            let targetUserQuery = PFUser.query()
            targetUserQuery?.whereKey("username", equalTo: self.usernameTextField.text!)
            targetUserQuery?.getFirstObjectInBackgroundWithBlock({ (result: PFObject?, error: NSError?) -> Void in
                if let targetUser = result as? PFUser {
                    self.targetUser = targetUser
                    let shareActivity = PFObject(className: kPAPActivityClassKey)
                    shareActivity.setObject(PFUser.currentUser()!, forKey: kPAPActivityFromUserKey)
                    shareActivity.setObject(self.targetUser!, forKey: kPAPActivityToUserKey)
                    shareActivity.setObject(kPAPActivityTypeShare, forKey: kPAPActivityTypeKey)
                    
                    let followACL = PFACL(user: PFUser.currentUser()!)
                    followACL.setPublicReadAccess(true)
                    shareActivity.ACL = followACL
                    
                    shareActivity.saveInBackgroundWithBlock { (succeeded, error) in
                        self.shareButton.enabled = false
                        self.shareButton.backgroundColor = UIColor.grayColor()
                    }
                    
                }
            })

        }
        */
    }
    
    func doneButtonTapped() {
        // self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    //MARK: Gestures
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self.usernameTextField.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        // self.usernameTextField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // usernameTextField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func initializeStaticViews() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
         self.navigationController?.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: UIFont(name: Constants.IconFontProperties.kFontName, size: Constants.FontProperties.kFontSize)!], for: UIControlState())
    }
}
