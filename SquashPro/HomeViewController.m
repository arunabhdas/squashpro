//
//  HomeViewController.m
//  iOSXomXom
//
//  Created by brlaruda on 12/18/14.
//  Copyright (c) 2014 Jamdeo. All rights reserved.
//

#import "HomeViewController.h"
#import "DraggableViewBackground.h"
#import "QuartzCore/QuartzCore.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize containerView;
@synthesize childTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.containerView.clipsToBounds = YES;
    UISwipeGestureRecognizer *recog = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeText)];
    recog.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.containerView addGestureRecognizer:recog];
    self.containerView.layer.borderWidth = 1.0f;
    self.containerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.containerView.layer.cornerRadius = 5.0f;
    

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
