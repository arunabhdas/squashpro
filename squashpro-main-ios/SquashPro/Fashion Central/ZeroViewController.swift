//
//  ZeroViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import UIKit
import FontAwesome_swift
class ZeroViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var tableView: UITableView!
    var products = [Product]()
    var refreshControl:UIRefreshControl!
    var detailViewController: DetailViewController?
    var currentName:String?
    var currentSelectedLeftMenuIndex:Int?
    var currentProductObjectId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSelectedLeftMenuIndex = Constants.Categories.kTitleNewArrivals;
        print("View did load was called\(currentSelectedLeftMenuIndex)")
        NotificationCenter.default.addObserver(self, selector: #selector(ZeroViewController.setCurrentSelected(_:)), name: NSNotification.Name(rawValue: Constants.NotificationKeys.kLeftMenuNotificationKey), object: nil)
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.colorRed
        self.navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = Constants.Colors.colorPrintexZero
        
        initializeStaticViews()
        let tableViewFrame = self.view.frame
        // let xMargin:CGFloat = 30.0
        // let yTopMargin:CGFloat = 5.0
        // tableViewFrame.origin.x += xMargin
        // tableViewFrame.origin.y += yTopMargin
        // tableViewFrame.size.width -= 2.0 * xMargin
        // tableViewFrame.size.height /= 1.0
        
        // tableView = UITableView(frame: self.view.frame)
        tableView = UITableView(frame: tableViewFrame)
        
        // tableView.registerClass(ProductItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = Constants.Colors.colorRed
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.showsVerticalScrollIndicator = false
       
        /*
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Loading")
        self.refreshControl.addTarget(self, action: "refreshTable:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.addSubview(refreshControl)
        
        */
        self.view.addSubview(tableView)
        doReload()

        
    }
  
    //MARK: UITableViewDatasource
    @objc func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    @objc func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return self.imageTexts.count
        
        // print("Number included \(products.count)")
        return self.products.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "ItemCell"
        let cell: ItemCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCell
        // cell.titleLabel.text = self.products[indexPath.row].name
        
        // cell.titleLabel.textColor = UIColor.whiteColor()
        // cell.titleLabel.font = UIFont(name:Constants.FontProperties.kFontName, size:20)
        cell.backgroundColor = UIColor.clear
        cell.thumbnailImageView.image = UIImage(named: "kate_french_lace_300")

        
        return cell
    }
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailViewController = storyboard.instantiateViewController(withIdentifier: "detail") as? DetailViewController
        
        self.currentName = self.products[indexPath.row].name
        self.currentProductObjectId = self.products[indexPath.row].objectId
        print("currentProductObjectId\(self.products[indexPath.row].objectId)")
        if (detailViewController != nil) {
            
            detailViewController!.currentMainImage = self.products[indexPath.row].mainImage
            detailViewController!.currentName = self.currentName
            detailViewController!.currentProductObjectId = self.currentProductObjectId
            print("currentProductObjectId\(currentProductObjectId)")
        }
        
        self.navigationController?.pushViewController(detailViewController!, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
       print("prepareForSegue")
            // let detailVC =  segue.destinationViewController as! DetailViewController
        if (detailViewController != nil) {
            
            // detailViewController!.currentMainImage = self.currentMainImage
            detailViewController!.currentName = self.currentName
            detailViewController!.currentProductObjectId = self.currentProductObjectId
            print("currentProductObjectId\(currentProductObjectId)")
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let selectionColor = UIView() as UIView
        // selectionColor.layer.borderWidth = 2
        // selectionColor.layer.borderColor = UIColor.whiteColor().CGColor
        // selectionColor.backgroundColor = Constants.Colors.colorRed
        cell.selectedBackgroundView = selectionColor
    }
   
    /*
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.refreshControl.endRefreshing()
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func refreshTable(refreshControl: UIRefreshControl) {
        if !(self.refreshControl.refreshing) {
            doReload()
        }
    }
    */
    func doReload() {
        // FIXME : TODO
            
    }
    func initializeStaticViews() {
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
    
    // MARK: actOnSpecialNotification
    func setCurrentSelected(_ notification: Notification) {
        guard let currentSelected = notification.object else {
            return
        }
        self.currentSelectedLeftMenuIndex = currentSelected as? Int
        print("menuItem \(self.currentSelectedLeftMenuIndex)");
        doReload()
    }
   
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

