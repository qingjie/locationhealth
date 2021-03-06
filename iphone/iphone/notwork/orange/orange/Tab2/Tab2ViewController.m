//
//  Tab2ViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Tab2ViewController.h"
#import "DailyViewController.h"
#import "WeeklyViewController.h"
#import "MonthlyViewController.h"
#import "JSON.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

@synthesize segmentedControl;
@synthesize dailyViewController;

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
    
    //array = [[NSArray alloc] initWithObjects:@"Line",@"Pie",nil];
    
    //self.navigationItem.title = @"Report";
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(action:)];
    
    self.navigationItem.rightBarButtonItem = infoButton;
    
    
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Daily",@"Weekly",@"Monthly",nil]];
    
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
    dailyViewController = [[DailyViewController alloc] init];
    [self.view addSubview:dailyViewController.view];
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
			dailyViewController = [[DailyViewController alloc] init];
            [self.view addSubview:dailyViewController.view];
            
            break;
        case 1:
            NSLog(@"BBBB");
            NSArray *array2 = [self.view subviews];
			if ([array2 count] == 2) {
				[[array2 objectAtIndex:1] removeFromSuperview];
			}
			WeeklyViewController *weeklyViewController = [[[WeeklyViewController alloc] init] autorelease];			
			[self.view addSubview:weeklyViewController.view];
            break;
        case 2:
            NSLog(@"CCCC");
            NSArray *array3 = [self.view subviews];
			if ([array3 count] == 2) {
				[[array3 objectAtIndex:1] removeFromSuperview];
			}
			MonthlyViewController *monthlyViewController = [[[MonthlyViewController alloc] init] autorelease];
			[self.view addSubview:monthlyViewController.view];
            break;
        default:
            break;
    }
} 


- (void)action:(id)sender
{
    [self selectMajor];
}


-(void) selectMajor
{
    CustomPickerView  *alert = [[CustomPickerView alloc]
                                initWithTitle:@"Filter"
                                message:nil
                                delegate:self
                                cancelButtonTitle:@"Cancel"
                                otherButtonTitles:@"Submit", nil];
    [alert show];
  
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    NSLog(@"preSetAlertView.....");
    // [(CustomPickerView *)alertView presetSlidersWithColor:[UIColor blueColor]];
    //[(PTColorAlertView *)alertView presetSlidersWithRandomValues];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            //Cancel
            break;
        case 1:
            //Set
            NSLog(@"%@",[(CustomPickerView *)alertView getResult]);
            break;
        default:
            break;
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return 20;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [NSString stringWithFormat:@"%@-%d", component == 1 ? @"R" : @"L", row];
}

@end
