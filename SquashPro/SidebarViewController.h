//
//  SidebarViewController.h
//  iOSXomXom
//
//  Created by coder on 1/2/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SidebarViewController;

@protocol SidebarViewDelegate<NSObject>


- (void)sidebarViewController:(SidebarViewController *)controller didUpdateWithItem:(NSString *)item;

@end


@interface SidebarViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, SidebarViewDelegate>




@property  NSInteger selectedValue;

@property (nonatomic, weak) id <SidebarViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *items;

@end
