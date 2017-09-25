//
//  AppDelegate.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UITabBarController *tabBarController;
    UINavigationController *_navigationController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UITabBarController * tabBarController;
@property (nonatomic, retain) UINavigationController *navigationController;

- (void) showTabBarController;

@end
