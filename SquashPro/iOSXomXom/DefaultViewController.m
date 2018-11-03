//
//  DefaultViewController.m
//  iOSXomXom
//
//  Created by brlaruda on 12/12/14.
//  Copyright (c) 2014 Jamdeo. All rights reserved.
//

#import "DefaultViewController.h"





#import "AFNetworking.h"
#import "XomXomResponse.h"
#import "JSONModel+networking.h"

@interface DefaultViewController ()




@end

@implementation DefaultViewController
@synthesize imageView;
@synthesize uuidTextField;
static const BOOL LOCAL_HOST_TESTING = true;


static NSString *const kKeychainItemName = @"xom-xom-plus";
NSString *kMyClientID = @"905608273633-utekuhk13kcntf8ffcespqavnjagcvgi.apps.googleusercontent.com";
NSString *kMyClientSecret = @"nf6OEvZbeiuDXHRJI2XZY9DI";
NSString *scope = @"https://www.googleapis.com/auth/userinfo.email"; // scope for email
NSString *uuidOne = @"3043530e-5206-408a-b142-dd766e4493d1";
// 5b498c53-6b4f-4c52-9cfc-3e4a5cceb54f
// 3043530e-5206-408a-b142-dd766e4493d1
NSString *baseURL = @"https://xom-xom-plus.appspot.com/_ah/api/xomXomApi2/v14/promotioncard/";

bool signedIn = false;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.uuidTextField setText:uuidOne];
    
    
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

- (IBAction)getPromotionCardButtonTapped:(id)sender {

    
}

- (IBAction)createRandomPromotionCardButtonTapped:(id)sender {

    
}

- (IBAction)signInButtonTapped:(id)sender {


}

- (IBAction)getCardButtonTapped:(id)sender {
    
    [imageView setImage:[UIImage imageNamed:@"outline.png"]];
    
    NSString *testUrl = [baseURL stringByAppendingString:self.uuidTextField.text];
    
    NSURL *url = [NSURL URLWithString:testUrl];
    

    
    // 2
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];

    
    [JSONHTTPClient getJSONFromURLWithString:testUrl
                                  completion:^(id json, JSONModelError *err) {
                                      XomXomResponse *response = [[XomXomResponse alloc] initWithDictionary: json error:nil];
                                      NSLog(@"cardName : %@", [response uuid]);
                                      
                                      NSString *data64URLString = [NSString stringWithFormat:@"data:;base64,%@", [response image]];
                                      NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:data64URLString]];
                                      UIImage *image = [UIImage imageWithData:data];
                                      [imageView setImage:image];
                                      

        }];
    

}






@end
