//
//  SidebarViewController.m
//  iOSXomXom
//
//  Created by coder on 1/2/15.
//  Copyright (c) 2015 Jamdeo. All rights reserved.
//

#import "SidebarViewController.h"
#import "Item.h"
#import "DebugTableViewCell.h"
#import "StartViewController.h"
#import "SWRevealViewController.h"

@interface SidebarViewController ()

@end

@implementation SidebarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"primary_bg_1"]];
    
    self.items = [NSMutableArray arrayWithCapacity:20];
    
    Item *item = [[Item alloc] init];
    
    item.titleInfo = @"News";
    
    item.descInfo = @"Exchange Desc";
    
    
    [self.items addObject:item];
    
    
    Item *item2 = [[Item alloc] init];
    
    item2.titleInfo = @"Events";
    
    [self.items addObject:item2];
    
    Item *item3 = [[Item alloc] init];
    
    item3.titleInfo = @"Players";
    
    [self.items addObject:item3];
    
    Item *item4 = [[Item alloc] init];
    
    item4.titleInfo = @"Teams";
    
    [self.items addObject:item4];
    
    Item *item5 = [[Item alloc] init];
    
    item5.titleInfo = @"Calendar";
    
    [self.items addObject:item5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.items count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"SquashPro";
            break;
    }
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DebugTableViewCell *cell = (DebugTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DebugTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Item *item = (self.items)[indexPath.row];
    
    cell.titleInfoLabel.text = item.titleInfo;
    
    switch (indexPath.row) {
        case 0:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_exchange.png"]];
            break;
        case 1:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_activity.png"]];
            break;
        case 2:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_devices.png"]];
            break;
        case 3:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_cards.png"]];
            break;
        case 4:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_add_card.png"]];
            break;
        default:
            [cell.thumbnailInfoImageView setImage:[UIImage imageNamed:@"ic_menu_add_card.png"]];
            break;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



#pragma mark Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"---%ld", indexPath.row);
    self.selectedValue = indexPath.row;

    
    [self.parentViewController performSegueWithIdentifier:@"sw_front" sender:self];
    UINavigationController *controller = [self.parentViewController.childViewControllers lastObject];
    
    StartViewController *svc = [controller.childViewControllers firstObject];
    
    NSString *itemToPassBack = [[self.items objectAtIndex:indexPath.row] titleInfo] ;
    
    [svc setFinalValue:itemToPassBack];
    
    [self.delegate sidebarViewController:self didUpdateWithItem:itemToPassBack];
    
    
    
}

#pragma mark Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"prepareForSegue was called %@", segue.identifier);


}




/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
