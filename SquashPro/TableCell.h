//
//  MediaCell.h
//  Nomad
//
//  Created by Das on 12/25/12.
//  Copyright (c) 2012 AppLiaisonInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *thumbnailInfoImageView;

@property (nonatomic, strong) IBOutlet UILabel *titleInfoLabel;

@property (nonatomic, strong) IBOutlet UILabel *descInfoLabel;

@end
