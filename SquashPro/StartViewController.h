//
//  MainViewController.h
//  iOSXomXom
//
//  Created by coder on 1/2/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SidebarViewController.h"

@interface StartViewController : UIViewController<SidebarViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property(nonatomic, strong) NSString *value;
@property (weak, nonatomic) IBOutlet UILabel *vcLabel;

-(void) setFinalValue:(NSString *) value;
@end
