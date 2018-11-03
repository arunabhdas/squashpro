//
//  DefaultViewController.h
//  iOSXomXom
//
//  Created by brlaruda on 12/12/14.
//  Copyright (c) 2014 Jamdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultViewController : UIViewController
- (IBAction)getPromotionCardButtonTapped:(id)sender;

- (IBAction)createRandomPromotionCardButtonTapped:(id)sender;
- (IBAction)signInButtonTapped:(id)sender;

- (IBAction)getCardButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *uuidTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
