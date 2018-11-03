//
//  EmptyViewController.h
//  iOSXomXom
//
//  Created by coder on 1/4/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@protocol RightPanelViewControllerDelegate <NSObject>

@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;

@required
- (void)itemSelected:(Item *)item;

@end

@interface EmptyViewController : UIViewController
@property (nonatomic, assign) id<RightPanelViewControllerDelegate> delegate;
@end
