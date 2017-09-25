//
//  RadiusViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/20/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "RadiusViewController.h"

@interface RadiusViewController ()

@end

@implementation RadiusViewController
@synthesize tableContents;
@synthesize sortedKeys;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.navigationItem.title = @"Radius";
    
	NSArray *arrTemp1 = [[NSArray alloc]initWithObjects:@"1 miles",@"5 miles",@"10 miles",nil];
	NSDictionary *temp =[[NSDictionary alloc]initWithObjectsAndKeys:arrTemp1,@"",nil];
	self.tableContents =temp;
	[temp release];
	NSLog(@"table %@",self.tableContents);
	NSLog(@"table with Keys %@",[self.tableContents allKeys]);
	self.sortedKeys =[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
	NSLog(@"sorted %@",self.sortedKeys);
	[arrTemp1 release];
    
    
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
	if ([indexPath row] == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    
	return cell;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
     NSUInteger row = [indexPath row];
     NSString *rowValue = [listData objectAtIndex:row];
     //NSLog(rowValue);
     
     NSString *message = [[NSString alloc] initWithFormat:rowValue];
     UIAlertView *alert = [[UIAlertView alloc] 
     initWithTitle:@"You selected" 
     message:message delegate:nil 
     cancelButtonTitle:@"OK" 
     otherButtonTitles:nil];
     [alert show];
     
     [alert release];
     [message release];	
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
     */
}

@end
