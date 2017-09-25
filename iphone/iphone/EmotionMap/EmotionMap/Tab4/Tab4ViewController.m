//
//  Tab4ViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Tab4ViewController.h"

@interface Tab4ViewController ()

@end

@implementation Tab4ViewController

@synthesize tableContents;
@synthesize sortedKeys;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Setting";
    
	NSArray *arrTemp1 = [[NSArray alloc]initWithObjects:@"Time",@"Radius",@"Chart",nil];
	NSDictionary *temp =[[NSDictionary alloc]initWithObjectsAndKeys:arrTemp1,@"",nil];
	self.tableContents =temp;
	[temp release];
	NSLog(@"table %@",self.tableContents);
	NSLog(@"table with Keys %@",[self.tableContents allKeys]);
	self.sortedKeys =[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
	NSLog(@"sorted %@",self.sortedKeys);
	[arrTemp1 release];
    

}


- (void)dealloc {
	[tableContents release];
	[sortedKeys release];
    [super dealloc];
}

#pragma mark Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sortedKeys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self.sortedKeys objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:section]];
	return [listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	
	UITableViewCell * cell = [tableView 
							  dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    NSUInteger row = [indexPath row];
       
    
	if(cell == nil) {
		
        cell = [[[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleDefault 
                 reuseIdentifier:SimpleTableIdentifier] autorelease];
                    
    }
     
    
    cell.textLabel.text = [listData objectAtIndex:row];
	//cell.detailTextLabel = @"test";
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //UITableViewCellAccessoryCheckmark
	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  if ([indexPath row] == 0) {
        TimeViewController *timeViewController = [[TimeViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [timeViewController setTitle:@"Time"];
        [[self navigationController] pushViewController:timeViewController animated:YES];
    }else if([indexPath row]==1){
        RadiusViewController *radiusViewController = [[RadiusViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [radiusViewController setTitle:@"Radius"];
        [[self navigationController] pushViewController:radiusViewController animated:YES];
    }else if([indexPath row]==2){
        ChartViewController *chartViewController = [[ChartViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [chartViewController setTitle:@"Chart"];
        [[self navigationController] pushViewController:chartViewController animated:YES];
    }
    
}



@end
