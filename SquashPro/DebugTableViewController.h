//
//  DebugTableViewController.h
//  iOSXomXom
//
//  Created by coder on 1/2/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DebugTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;

@end
