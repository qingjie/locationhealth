

#import "MapKit3AppDelegate.h"
#import "MainViewController.h"

@implementation MapKit3AppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;

	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}



@end
