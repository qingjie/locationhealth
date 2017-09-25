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

@interface AppDelegate()
- (void)scheduleAlarmForDate:(NSDate *)theDate;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController;
@synthesize navigationController = _navigationController;
@synthesize globalarray;


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
    tabBarController.selectedIndex = 0;
    [self.window addSubview:tabBarController.view];
}

- (void)justExitApp {
    
	exit(0);
}
#pragma mark -
#pragma mark Background Task Handle
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
	// Request permission to run in the background. Provide an
	// expiration handler in case the task runs long.
	NSAssert(self->bgTask == UIBackgroundTaskInvalid, nil);
	
	self->bgTask = [application beginBackgroundTaskWithExpirationHandler: ^{
		// Synchronize the cleanup call on the main thread in case
		// the task catully finished at around the same time.
		dispatch_async(dispatch_get_main_queue(), ^{
			
			if (UIBackgroundTaskInvalid != self->bgTask) {
				
				[application endBackgroundTask:self->bgTask];
				self->bgTask = UIBackgroundTaskInvalid;
			}
		});
	}];
	
	// Start the long-running task and return immediately.
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
				   ^{
					   // Do the work assoicated with the task.
					   
					   // Synchronize the cleanup all on the main thread in case
					   // the task catully finished at around the same time.
					   dispatch_async(dispatch_get_main_queue(), ^{
						   
						   if (UIBackgroundTaskInvalid != self->bgTask) {
                               
							   [application endBackgroundTask:self->bgTask];
							   self->bgTask = UIBackgroundTaskInvalid;
						   }
					   });
				   });
}
#pragma mark -
#pragma mark Local Notifications
- (void)scheduleAlarmForDate:(NSDate *)theDate {
	
	UIApplication *app = [UIApplication sharedApplication];
	NSArray *oldNotifications = [app scheduledLocalNotifications];
	
	// Clear out the old notification before scheduling a new one.
	if (0 < [oldNotifications count]) {
		
		[app cancelAllLocalNotifications];
	}
	
	// Create a new notification
	UILocalNotification *alarm = [[UILocalNotification alloc] init];
	if (alarm) {
        
		alarm.fireDate = theDate;
		alarm.timeZone = [NSTimeZone defaultTimeZone];
		alarm.repeatInterval = 0;
		alarm.soundName = @"ping.caf";//@"default";
		alarm.alertBody = [NSString stringWithFormat:@"Time to wake up! Now is\n[%@]",
						   [NSDate dateWithTimeIntervalSinceNow:10]];
		
		[app scheduleLocalNotification:alarm];
		[alarm release];
	}
}


-(void) applicationWillResignActive:(UIApplication *)application {
    NSLog(@"------------------Asleep------------------");
    /*
     UIDevice* device = [UIDevice currentDevice];
     BOOL backgroundSupported = NO;
     if ([device respondsToSelector:@selector(isMultitaskingSupported)])
     backgroundSupported = device.multitaskingSupported;
     NSLog(@"backgroundSupported[%@]",backgroundSupported ? @"YES" : @"NO");
     
     
     NSDate *oneMinuteFromNow = [NSDate dateWithTimeIntervalSinceNow:3];
     NSLog(@"At[%@]will show alert~!", oneMinuteFromNow);
     [self scheduleAlarmForDate:oneMinuteFromNow];
     
     [self performSelector:@selector(justExitApp) withObject:nil afterDelay:10];
     */
    
}

-(void) applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"------------------Awake------------------");
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"------------------applicationWillEnterForeground------------------");
}




@end
