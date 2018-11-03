//
//  PostItemCell.swift
//  Central
//
//

import UIKit

class ProductItemCell : UITableViewCell {
    // var thumbnailImageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var dateLabel: UILabel = UILabel()
    // let colorOne:UIColor = UIColor(red:  74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 100.0/100.0)
    // var colorTwo:UIColor = UIColor(red:  164/255.0, green: 199/255.0, blue: 240/255.0, alpha: 100.0/100.0)
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.titleLabel.textColor = Constants.Colors.colorRed
        // self.titleLabel.font = UIFont(name: Constants.FontProperties.kFontName, size: Constants.FontProperties.kFontSize)
        // let placeholder = UIImage.fontAwesomeIconWithName(.CameraRetro, textColor: Constants.Colors.colorRed, size: CGSizeMake(50, 50))
        // thumbnailImageView.image = placeholder
        // self.contentView.addSubview(thumbnailPFImageView)
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // thumbnailImageView.frame = CGRectMake(10, 3, 50, 50)
        // thumbnailPFImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 300)
        // titleLabel.frame = CGRectMake(10, 550, self.frame.width, 550)
        // titleLabel.textColor = UIColor.whiteColor()
        // descriptionLabel.frame = CGRectMake(200, 10, self.frame.width - 20, 25)
        // descriptionLabel.textColor = UIColor.blackColor()
        // dateLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
        // dateLabel.textColor = UIColor.blackColor()
        
        
    }
  
    /*
    override func layoutSubviews() {
        self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width - 50, self.bounds.size.height)
        super.layoutSubviews()
    }
    */
    
}

