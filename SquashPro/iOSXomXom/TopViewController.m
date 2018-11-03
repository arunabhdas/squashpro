//
//  TopViewController.m
//  iOSXomXom
//
//  Created by coder on 1/1/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()


@end

@implementation TopViewController
- (IBAction)goToTabsButtonTapped:(id)sender {
    
    // [self performSegueWithIdentifier:@"TopToTabSegue" sender:self];
    
    
}
- (IBAction)goToHamburgerTapped:(id)sender {
    [self performSegueWithIdentifier:@"TopToSWReveal" sender:self];
    
}
- (IBAction)gotoSliderTapped:(id)sender {
    // [self performSegueWithIdentifier:@"TopToMainSegue" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
