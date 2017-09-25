//
//  AppDelegate.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "AppDelegate.h"
#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "Tab3ViewController.h"
#import "Tab4ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController;
@synthesize navigationController = _navigationController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self showTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void) showTabBarController{
    self.tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.tintColor = [UIColor orangeColor];
    
    
    Tab1ViewController  *tab1ViewController = [[Tab1ViewController alloc] init];
    NSString *strImage1 = [NSString stringWithFormat:@"line.png"];
    UIImage *image1 = [UIImage imageNamed:strImage1];
    tab1ViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"TRACKING" image:image1 tag:1];
    //firstNav.tabBarItem.badgeValue = @"6";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:tab1ViewController];
    nav1.navigationBar.tintColor = [UIColor orangeColor]; 
    
    
    Tab2ViewController *tab2ViewController = [[Tab2ViewController alloc] init];
    NSString *strImage2 = [NSString stringWithFormat:@"list.png"];
    UIImage *image2 = [UIImage imageNamed:strImage2];
    tab2ViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"REPORT" image:image2 tag:2];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:tab2ViewController];
    nav2.navigationBar.tintColor = [UIColor orangeColor]; 
    
    
    Tab3ViewController *tab3ViewController = [[Tab3ViewController alloc] init];
    NSString *strImage3 = [NSString stringWithFormat:@"user.png"];
    UIImage *image3 = [UIImage imageNamed:strImage3];
    tab3ViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"PROFILE" image:image3 tag:3];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:tab3ViewController];
    nav3.navigationBar.tintColor = [UIColor orangeColor]; 
    
    
    Tab4ViewController *tab4ViewController = [[Tab4ViewController alloc] init];
    NSString *strImage4 = [NSString stringWithFormat:@"settings.png"];
    UIImage *image4 = [UIImage imageNamed:strImage4];
    tab4ViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"SETTING" image:image4 tag:4];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:tab4ViewController];
    nav4.navigationBar.tintColor = [UIColor orangeColor]; 
    
    
    NSArray *arrayControllers = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4, nil];
    tabBarController.viewControllers = arrayControllers;
    [self.window addSubview:tabBarController.view];
}




@end
