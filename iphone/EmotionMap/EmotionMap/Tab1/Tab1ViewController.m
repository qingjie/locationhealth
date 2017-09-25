//
//  Tab1ViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Tab1ViewController.h"
#import "MapViewController.h"
#import "ListViewController.h"
#import "GridViewController.h"
#import "JSON.h"


@interface Tab1ViewController()

@end


@implementation Tab1ViewController

@synthesize segmentedControl;
@synthesize mapViewController;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(action:)];
   
 
    self.navigationItem.rightBarButtonItem = infoButton;

	
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"List",@"Gird",nil]];
                                            
    [segmentedControl setFrame:CGRectMake(0,10,200,30)];
    //segmentedControl.center = CGPointMake(self.navigationController.navigationBar.bounds.size.width / 2, self.navigationController.navigationBar.bounds.size.height / 2);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = [UIColor orangeColor];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

    self.navigationItem.titleView = segmentedControl;
   
    
    NSArray *array1 = [self.view subviews];
    if ([array1 count] == 2) {
        [[array1 objectAtIndex:1] removeFromSuperview];
    }
    mapViewController = [[MapViewController alloc] init];
    [self.view addSubview:mapViewController.view];
     
}

- (void)action:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Filter" 
													message:@"Filter" 
												   delegate:nil 
										  cancelButtonTitle:@"Cancel" 
										  otherButtonTitles:nil];
	[alert show];
}


-(void)segmentAction:(id) sender
{
    switch([sender selectedSegmentIndex])
    {
        case 0:
            NSLog(@"AAAA");
           
            NSArray *array1 = [self.view subviews];
			if ([array1 count] == 2) {
				[[array1 objectAtIndex:1] removeFromSuperview];
			}
			mapViewController = [[MapViewController alloc] init];
			[self.view addSubview:mapViewController.view];

            
            break;
        case 1:
            NSLog(@"BBBB");
            NSArray *array2 = [self.view subviews];
			if ([array2 count] == 2) {
				[[array2 objectAtIndex:1] removeFromSuperview];
			}
			ListViewController *listViewController = [[[ListViewController alloc] init] autorelease];			
			[self.view addSubview:listViewController.view];
            break;
        case 2:
            NSLog(@"CCCC");
            NSArray *array3 = [self.view subviews];
			if ([array3 count] == 2) {
				[[array3 objectAtIndex:1] removeFromSuperview];
			}
			GridViewController *gridViewController = [[[GridViewController alloc] init] autorelease];
			[self.view addSubview:gridViewController.view];
            break;
        default:
            break;
    }
} 


-(void)popover:(id)sender
{
    //the controller we want to present as a popover
    EmotionTableController *controller = [[EmotionTableController alloc] initWithStyle:UITableViewStylePlain];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    [controller release];
    
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = FPPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(200, 300);
    }
    popover.arrowDirection = FPPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender]; 
}


- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController 
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
    [visiblePopoverController autorelease];
}


@end
