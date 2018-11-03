//
//  EmptyViewController.m
//  iOSXomXom
//
//  Created by coder on 1/4/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import "EmptyViewController.h"

@interface EmptyViewController ()
@property (nonatomic) UINavigationBar *navBar;
@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.navBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIColor *seagreenColor = [UIColor colorWithRed:9.0/255 green:85.0/255.0 blue:112.0/255 alpha:1.0];
    self.navBar.barTintColor = seagreenColor;
    
    // UINavigationItem *navItem = [[UINavigationItem alloc] init];
    // navItem.title = @"MoxApp";
    // self.navBar.items = @[ navItem ];
    
    [self.view addSubview:self.navBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
