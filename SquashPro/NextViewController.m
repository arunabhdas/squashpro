//
//  NextViewController.m
//  iOSXomXom
//
//  Created by coder on 1/4/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (nonatomic) UINavigationBar *navBar;
@property (nonatomic) IBOutlet UILabel *imageTitle;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"artwork_bg.png"]];
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.navBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    UIColor *seagreenColor = [UIColor colorWithRed:9.0/255 green:85.0/255.0 blue:112.0/255 alpha:1.0];
    self.navBar.barTintColor = seagreenColor;

    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"MoxApp";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonTapped)];
    navItem.leftBarButtonItem = leftButton;
    navItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTapped)];
    navItem.rightBarButtonItem = rightButton;
    navItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navBar.items = @[ navItem ];

    //change the tint color of the bar button item


    
    
    self.imageTitle =  [[UILabel alloc] init];
    [self.imageTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.imageTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:30.0];
    self.imageTitle.textColor = [UIColor whiteColor];
    self.imageTitle.text = @"My Shared";
    
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.imageTitle];
    NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_navBar, _imageTitle);
    
    NSDictionary *metrics = @{@"imageEdge":@150.0,@"padding":@20.0};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_navBar(64@1000)]-[_imageTitle]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_navBar]|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    /*
     [self.view addConstraint:[NSLayoutConstraint
     constraintWithItem:self.imageTitle
     attribute:NSLayoutAttributeCenterY
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeCenterY
     multiplier:1.0
     constant:0]];
     */
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.imageTitle
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0]];
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

#pragma mark TargetAction
- (void) leftButtonTapped {
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
    
    
}

- (void) rightButtonTapped {
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
    
}

@end
