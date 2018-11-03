//
//  RightPanelViewController.h
//  SlideoutNavigation
//
//  Created by Tammy Coron on 1/10/13.
//  Copyright (c) 2013 Tammy L Coron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@protocol RightPanelViewControllerDelegate <NSObject>

@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;

@required
- (void)itemSelected:(Item *)item;

@end

@interface RightPanelViewController : UIViewController

@property (nonatomic, assign) id<RightPanelViewControllerDelegate> delegate;

@end
