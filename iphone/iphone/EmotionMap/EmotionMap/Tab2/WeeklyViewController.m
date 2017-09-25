//
//  WeeklyViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/10/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "WeeklyViewController.h"

@interface WeeklyViewController ()

@end

@implementation WeeklyViewController

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
    CLMView *cv = [[CLMView alloc] initWithFrame:CGRectMake(0, 0, 320, 440)];
	
	cv.titleArr = [NSArray	arrayWithObjects:@"Happy0", @"Happy1", @"Happy2", @"Happy3",@"Happy4",nil];
	cv.valueArr = [NSArray arrayWithObjects:[NSNumber numberWithFloat:20],[NSNumber numberWithFloat:20],\
				   [NSNumber numberWithFloat:20],[NSNumber numberWithFloat:20],[NSNumber numberWithFloat:20],nil];
	cv.colorArr = [NSArray arrayWithObjects:[UIColor yellowColor], [UIColor blueColor], [UIColor brownColor], [UIColor purpleColor] , [UIColor orangeColor],nil];
	
	[self.view addSubview: cv];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    
    return cell;
}

@end
