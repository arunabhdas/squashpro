//
//  CenterViewController.m
//  Navigation
//
//  Created by Tammy Coron on 1/19/13.
//  Copyright (c) 2013 Tammy L Coron. All rights reserved.
//

#import "CenterViewController.h"
#import "NextViewController.h"

#import "Item.h"

@interface CenterViewController ()

@property (nonatomic) IBOutlet UIImageView *mainImageView;
@property (nonatomic) IBOutlet UILabel *imageTitle;
@property (nonatomic) IBOutlet UILabel *imageCreator;
@property (nonatomic) IBOutlet UIButton *plusButton;


@property (nonatomic) IBOutlet AwesomeMenu *menu;
@property (nonatomic) UINavigationBar *navBar;
@property (nonatomic)  UINavigationItem *navItem;
@property (nonatomic, strong) NSMutableArray *imagesArray;

@end

@implementation CenterViewController

#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"artwork_bg.png"]];
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.navBar setTranslatesAutoresizingMaskIntoConstraints:NO];
     
    [self.navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
     

    UIColor *seagreenColor = [UIColor colorWithRed:9.0/255 green:85.0/255.0 blue:112.0/255 alpha:1.0];
    self.navBar.barTintColor = seagreenColor;
    
    self.navItem = [[UINavigationItem alloc] init];
    self.navItem.title = @"";

    UIImage* image = [UIImage imageNamed:@"menuButton"];
    CGRect frameimg = CGRectMake(0, 0, image.size.width, image.size.height);
    UIButton *leftNavBarButtonItemButton = [[UIButton alloc] initWithFrame:frameimg];
    [leftNavBarButtonItemButton setBackgroundImage:image forState:UIControlStateNormal];
    [leftNavBarButtonItemButton addTarget:self action:@selector(leftNavBtnMovePanelRight) forControlEvents:UIControlEventTouchUpInside];
    [leftNavBarButtonItemButton setShowsTouchWhenHighlighted:YES];
    self.leftNavButton = [[UIBarButtonItem alloc] initWithCustomView:leftNavBarButtonItemButton];
    // self.leftNavButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(leftNavBtnMovePanelRight)];
    self.navItem.leftBarButtonItem = self.leftNavButton;
    self.leftNavButton.tag = 1;
    
    self.navBar.items = @[ self.navItem ];
    
    self.imageTitle =  [[UILabel alloc] init];
    [self.imageTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.imageTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:30.0];
    self.imageTitle.textColor = [UIColor whiteColor];
    self.imageTitle.text = @"My Shared";
    
    self.plusButton = [[UIButton alloc] init];
    [self.plusButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.plusButton setImage:[UIImage imageNamed:@"btn_add.png"] forState:UIControlStateNormal];
    
    

    
    [[self.plusButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [self.plusButton setImage:[UIImage imageNamed:@"btn_add.png"] forState:UIControlStateNormal];
    
    
    // UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem-blank"];
    // UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-blank"];
    
    // UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    UIImage *starImage = [UIImage imageNamed:@"ic_create_moment_1"];
    
    
    // Default Menu
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    
    AwesomeMenuItem *starMenuItem6 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem7 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem8 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem9 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, starMenuItem7,starMenuItem8,starMenuItem9, nil];
    
    
    // NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];

    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];

    /*
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"btn_add_1"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    */
    self.menu = [[AwesomeMenu alloc] initWithFrame:CGRectMake(0, 0, 150, 200) startItem:startItem optionMenus:menus];
    self.menu.delegate = self;
    /*
    self.menu.menuWholeAngle = M_PI_2;
    self.menu.farRadius = 110.0f;
    self.menu.endRadius = 100.0f;
    self.menu.nearRadius = 90.0f;
    self.menu.animationDuration = 0.3f;
     */
    [self.menu setTranslatesAutoresizingMaskIntoConstraints:NO];
    // self.menu.startPoint = CGPointMake(50.0, 410.0);
    
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.imageTitle];
    // [self.view addSubview:self.plusButton];
    [self.view addSubview:self.menu];
    
    
    // NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_navBar, _imageTitle, _plusButton);
    
    NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_navBar, _imageTitle, _menu);
    
    NSDictionary *metrics = @{@"imageEdge":@150.0,@"padding":@20.0};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_navBar(64@1000)]-[_imageTitle]-[_menu]-|"
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
    /*
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.menu
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.menu
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0]];
    */
    /*
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-padding-[_navBar]->=0-[_plusButton(44@1000)]-padding-|"
                               options:NSLayoutFormatAlignAllLeft
                               metrics:metrics
                               views:elementsDict]];
    
    */
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-padding-[_navBar]->=0-[_menu]-padding-|"
                               options:NSLayoutFormatAlignAllLeft
                               metrics:metrics
                               views:elementsDict]];
     


}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark -
#pragma mark View Will/Did Appear

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

#pragma mark -
#pragma mark View Will/Did Disappear

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark Button Actions

- (void) leftNavBtnMovePanelRight {
    
    switch (self.leftNavButton.tag) {
        case 0 : {
            [_delegate movePanelToOriginalPosition];
            NSLog(@"_delegate movePanelToOriginalPosition");
            break;
        }
        case 1 : {
            [_delegate movePanelRight];
            NSLog(@"_delegate movePanelRight");
            break;
        }
    }
    
    // [_delegate movePanelRight];
}

- (IBAction)btnMovePanelRight:(id)sender {
    UIButton *button = sender;
    switch (button.tag) {
        case 0: {
            [_delegate movePanelToOriginalPosition];
            break;
        }
            
        case 1: {
            [_delegate movePanelRight];
            break;
        }
            
        default:
            break;
    }
}

- (IBAction)btnMovePanelLeft:(id)sender{
    UIButton *button = sender;
    switch (button.tag) {
        case 0: {
            [_delegate movePanelToOriginalPosition];
            break;
        }
            
        case 1: {
            [_delegate movePanelLeft];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark Delagate Method for capturing selected image

/*
 note: typically, you wouldn't create "duplicate" delagate methods, but we went with simplicity.
       doing it this way allowed us to show how to use the #define statement and the switch statement.
*/

- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator
{
    // only change the main display if an item was selected
    if (image)
    {
        NSLog(@"itemSelected image withTitle");
        self.mainImageView.image = image;
        self.imageTitle.text = [NSString stringWithFormat:@"%@", imageTitle];

        self.imageCreator.text = [NSString stringWithFormat:@"%@", imageCreator];
    }
}

- (void)itemSelected:(Item *)item
{
    NSLog(@"itemSelected");
    // only change the main display if an item was selected
    if (item)
    {
        [self showItemSelected:item];
    }
}

// setup the imageview with our selected item
- (void)showItemSelected:(Item *)itemSelected
{
    NSLog(@"showItemSelected");
    self.imageTitle.text = [NSString stringWithFormat:@"%@", itemSelected.titleInfo];
    self.imageCreator.text = [NSString stringWithFormat:@"%@", itemSelected.descInfo];
    [_delegate movePanelToOriginalPosition];
}

#pragma mark AwesomeMenuDelegate
- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %ld",(long)idx);
    NextViewController *nextvc = [[NextViewController alloc] init];
    [self presentViewController:nextvc animated:YES completion:^{
        //
    }];
    
    
}
- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}
- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"Menu is open!");
}

#pragma mark -
#pragma mark Default System Code
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
