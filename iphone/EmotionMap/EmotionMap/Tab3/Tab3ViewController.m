//
//  Tab3ViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Tab3ViewController.h"

@interface Tab3ViewController ()

@end

@implementation Tab3ViewController
@synthesize lblName;
@synthesize lblAge;
@synthesize lblNameValue;
@synthesize lblAgeValue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(loginFacebook:)];
    
    
    self.navigationItem.rightBarButtonItem = loginButton;

}

- (IBAction)loginFacebook:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" 
													message:@"Facebook." 
												   delegate:nil 
										  cancelButtonTitle:@"Cancel" 
										  otherButtonTitles:nil];
	[alert show];
}
@end
