//
//  BaseViewController.swift
//  CaliHairWorks
//
//

import UIKit


class BaseViewController: UIViewController {
    
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
}
