//
//  MediaCell.m
//  Nomad
//
//  Created by Das on 12/25/12.
//  Copyright (c) 2012 AppLiaisonInc. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

@synthesize thumbnailInfoImageView = _thumbnailInfoImageView;

@synthesize titleInfoLabel = _titleInfoLabel;

@synthesize descInfoLabel = _descInfoLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
