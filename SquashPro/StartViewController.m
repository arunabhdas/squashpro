//
//  MainViewController.m
//  iOSXomXom
//
//  Created by coder on 1/2/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import "StartViewController.h"
#import "SWRevealViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize sideBarButton = _sideBarButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_sideBarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:1.0f];
    
    
    
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"primary_bg_1"]];
    
    _sideBarButton.target = self.revealViewController;
    
    _sideBarButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    

    NSLog(@"=====================viewDidLoad was called");
    NSLog(@"This is the value to be displayed : %@", self.value);
    
    self.vcLabel.text = self.value;
    
}

#pragma mark SidebarViewDelegate

- (void)sidebarViewController:(SidebarViewController *)controller didUpdateWithItem:(NSString *)item;
{
    
    NSLog(@"==SidebarViewDelegate===================%@", item);
    
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

- (void) setFinalValue: (NSString *)value {

    self.value = value;
    
    NSLog(@"=====================%@", value);
}

@end
