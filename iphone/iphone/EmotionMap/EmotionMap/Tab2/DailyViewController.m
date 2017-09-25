//
//  DailyViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/10/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "DailyViewController.h"

@interface DailyViewController ()

@end

@implementation DailyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NTChartView *v = [[NTChartView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
	
	NSArray *g = [NSArray arrayWithObject:[NSMutableArray arrayWithObjects:
                                           [NSNumber numberWithFloat:18],
                                           [NSNumber numberWithFloat:30],
                                           [NSNumber numberWithFloat:16.5],
                                           [NSNumber numberWithFloat:55],
                                           [NSNumber numberWithFloat:40],nil]];
	v.groupData = g;
	
	[self.view addSubview:v];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
