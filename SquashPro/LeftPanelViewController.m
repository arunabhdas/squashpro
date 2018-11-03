//
//  LeftPanelViewController.m
//  SlideoutNavigation
//
//  Created by Tammy Coron on 1/10/13.
//  Copyright (c) 2013 Tammy L Coron. All rights reserved.
//

#import "LeftPanelViewController.h"

#import "Item.h"

@interface LeftPanelViewController ()

@property (nonatomic, weak) IBOutlet UITableView *myTableView;
@property (nonatomic, weak) IBOutlet UITableViewCell *cellMain;
@property (nonatomic) UINavigationBar *navBar;

@property (nonatomic, strong) NSMutableArray *arrayOfItems;

@end

@implementation LeftPanelViewController

#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:20];
    
    Item *item = [[Item alloc] init];
    
    item.titleInfo = @"Exchange";
    
    item.descInfo = @"Exchange Desc";
    
    [items addObject:item];
    
    Item *item2 = [[Item alloc] init];
    
    item2.titleInfo = @"Activity";
    
    item2.descInfo = @"Activity Desc";
    
    [items addObject:item2];
    
    Item *item3 = [[Item alloc] init];
    
    item3.titleInfo = @"Devices";
    
    item3.descInfo = @"Devices Desc";
    
    [items addObject:item3];
    
    Item *item4 = [[Item alloc] init];
    
    item4.titleInfo = @"Cards";
    
    item4.descInfo = @"Cards Desc";
    
    [items addObject:item4];
    
    Item *item5 = [[Item alloc] init];
    
    item5.titleInfo = @"Edit Profile";
    
    item5.descInfo = @"Edit Profile Desc";
    
    [items addObject:item5];
    
    // Do any additional setup after loading the view.
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.navBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIColor *seagreenColor = [UIColor colorWithRed:9.0/255 green:85.0/255.0 blue:112.0/255 alpha:1.0];
    self.navBar.barTintColor = seagreenColor;
    
    // UINavigationItem *navItem = [[UINavigationItem alloc] init];
    // navItem.title = @"MoxApp";
    // self.navBar.items = @[ navItem ];

    
    [self.view addSubview:self.navBar];
    
    NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_navBar);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_navBar(64@1000)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_navBar)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_navBar]|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementsDict]];
    
    
    self.arrayOfItems = [NSMutableArray arrayWithArray:items];
    
    [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.myTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"artwork_bg.png"]];
    
    [self.myTableView reloadData];
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
#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayOfItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellMainNibID = @"cellMain";
    
    
    
    _cellMain = [tableView dequeueReusableCellWithIdentifier:cellMainNibID];
    if (_cellMain == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"MainCellLeft" owner:self options:nil];
    }
    
    UIImageView *mainImage = (UIImageView *)[_cellMain viewWithTag:1];
    
    UILabel *imageTitle = (UILabel *)[_cellMain viewWithTag:2];
    UILabel *creator = (UILabel *)[_cellMain viewWithTag:3];
    
    if ([_arrayOfItems count] > 0)
    {
        Item *currentRecord = [self.arrayOfItems objectAtIndex:indexPath.row];
        
        // mainImage.image = currentRecord.image;
        imageTitle.text = [NSString stringWithFormat:@"%@", currentRecord.titleInfo];
        creator.text = [NSString stringWithFormat:@"%@", currentRecord.descInfo];
    }
    
    
    switch (indexPath.row) {
        case 0:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_exchange.png"]];
            break;
        case 1:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_activity.png"]];
            break;
        case 2:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_devices.png"]];
            break;
        case 3:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_cards.png"]];
            break;
        case 4:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_add_card.png"]];
            break;
        default:
            [mainImage setImage:[UIImage imageNamed:@"ic_menu_add_card.png"]];
            break;
    }
    
    _cellMain.backgroundColor = [UIColor clearColor];
    
    return _cellMain;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *currentRecord = [self.arrayOfItems objectAtIndex:indexPath.row];
    
    // Return Data to delegate: either way is fine, although passing back the object may be more efficient
    // [_delegate imageSelected:currentRecord.image withTitle:currentRecord.title withCreator:currentRecord.creator];
    // [_delegate animalSelected:currentRecord];
    
    [_delegate itemSelected:currentRecord];
}

#pragma mark -
#pragma mark Default System Code

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
