//
//  LeftMenuViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import Foundation
import UIKit
protocol LeftMenuVCDelegate:class{
    func didSelectMenuItem(_ controller:LeftMenuViewController, menuItem: Int)
}
class LeftMenuViewController: UIViewController {
    weak var leftMenuVCDelegate: LeftMenuVCDelegate?
    let titles: [String] = [Constants.MenuTitles.kTitleOne,
                            Constants.MenuTitles.kTitleTwo,
                            Constants.MenuTitles.kTitleThree,
                            Constants.MenuTitles.kTitleFour,
                            Constants.MenuTitles.kTitleFive,
                            Constants.MenuTitles.kTitleSix,
                            Constants.MenuTitles.kTitleSeven
        
    ]
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 20, y: (self.view.frame.size.height - 54 * Constants.NumItems.leftMenuNumItems) / 2.0, width: self.view.frame.size.width, height: 54 * Constants.NumItems.leftMenuNumItems)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FirstViewController())

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


// MARK: TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
   

        // let images: [String] = ["IconDeals", "IconTrends", "IconCelebs", "IconLabels", "IconCollections"]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .none
        /*
        switch indexPath.row {
        case 0:
                cell.imageView?.image = UIImage.fontAwesomeIconWithName(.ShoppingCart, textColor: UIColor.whiteColor(), size: CGSizeMake(30, 30))
            break;
        case 1:
            cell.imageView?.image = UIImage.fontAwesomeIconWithName(.BarChart, textColor: UIColor.whiteColor(), size: CGSizeMake(30, 30))
            break;
        case 2:
            cell.imageView?.image = UIImage.fontAwesomeIconWithName(.Female, textColor: UIColor.whiteColor(), size: CGSizeMake(30, 30))
            break;
        case 3:
            cell.imageView?.image = UIImage.fontAwesomeIconWithName(.Ticket, textColor: UIColor.whiteColor(), size: CGSizeMake(30, 30))
            break;
        case 4:
            cell.imageView?.image = UIImage.fontAwesomeIconWithName(.Tags, textColor: UIColor.whiteColor(), size: CGSizeMake(30, 30))
            break;
        default:
            break;
        }
        */
        
        // cell.imageView?.image = UIImage(named: images[indexPath.row])

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        // leftMenuVCDelegate?.didSelectMenuItem(self, menuItem: indexPath.row)
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NotificationKeys.kLeftMenuNotificationKey), object: indexPath.row)
        switch indexPath.row {
        case 0:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FirstViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 1:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: SecondViewController())
            sideMenuViewController?.hideMenuViewController()
            
            break
        case 2:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: ThirdViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 3:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FourthViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 4:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FifthViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 5:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: SixthViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 6:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: SeventhViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 7:
            // sideMenuViewController?.contentViewController = UINavigationController(rootViewController: EightViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 8:
            // sideMenuViewController?.contentViewController = UINavigationController(rootViewController: NinthViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        default:
            break
        }
        
        
    }
    
}
    
