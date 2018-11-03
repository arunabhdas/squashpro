//
//  CenterViewController.h
//  Navigation
//
//  Created by Tammy Coron on 1/19/13.
//  Copyright (c) 2013 Tammy L Coron. All rights reserved.
//

#import "LeftPanelViewController.h"
#import "RightPanelViewController.h"
#import "AwesomeMenu.h"

@protocol CenterViewControllerDelegate <NSObject>

@optional
- (void)movePanelLeft;
- (void)movePanelRight;

@required
- (void)movePanelToOriginalPosition;

@end

@interface CenterViewController : UIViewController <LeftPanelViewControllerDelegate, RightPanelViewControllerDelegate, AwesomeMenuDelegate>

@property (nonatomic, assign) id<CenterViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIButton *leftButton;
@property (nonatomic) IBOutlet UIBarButtonItem *leftNavButton;
@property (nonatomic, weak) IBOutlet UIButton *rightButton;
@property (nonatomic) IBOutlet UIBarButtonItem *rightNavButton;

@end
