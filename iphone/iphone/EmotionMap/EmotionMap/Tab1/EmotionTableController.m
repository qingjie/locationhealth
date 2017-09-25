//
//  EmotionTableController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "EmotionTableController.h"

@interface EmotionTableController ()

@end

@implementation EmotionTableController
@synthesize viewCell,itemArray;

-(void) loadData{
    itemArray=[[NSMutableArray alloc]init];
	NSArray * itemarray=[NSArray arrayWithObjects:
                         [[ImageAndTitle alloc]initWithImage:@"1.png" AndTitle:@"1"],
                         [[ImageAndTitle alloc]initWithImage:@"2.png" AndTitle:@"2"],
                         [[ImageAndTitle alloc]initWithImage:@"3.png" AndTitle:@"3"],
                         [[ImageAndTitle alloc]initWithImage:@"4.png" AndTitle:@"4"],
                         [[ImageAndTitle alloc]initWithImage:@"5.png" AndTitle:@"5"],
                         [[ImageAndTitle alloc]initWithImage:@"6.png" AndTitle:@"6"],
                         [[ImageAndTitle alloc]initWithImage:@"7.png" AndTitle:@"7"],
                         [[ImageAndTitle alloc]initWithImage:@"8.png" AndTitle:@"8"],
                         [[ImageAndTitle alloc]initWithImage:@"9.png" AndTitle:@"9"],
                         [[ImageAndTitle alloc]initWithImage:@"10.png" AndTitle:@"10"],
                         [[ImageAndTitle alloc]initWithImage:@"11.png" AndTitle:@"11"],
                         [[ImageAndTitle alloc]initWithImage:@"12.png" AndTitle:@"12"],
                         nil];
	[self setItem:itemarray];
}

-(void)setItem:(NSArray *)tempArray{
	[itemArray addObjectsFromArray:tempArray];
    
}

-(void)addItem:(ImageAndTitle *)iat{
	[itemArray addObject:iat];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Emotion";
    [self loadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
    return 80;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int i=[itemArray count]/3;
	//i++;
	return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *cellIdentifier = @"ViewCell";
	ViewCell *cell = (ViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"ViewCell" owner:self options:nil];
		cell = viewCell;
	}
    

    
    
	if ((indexPath.row*3)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*3];
        
		cell.lbl1.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn1 setTag:indexPath.row*3];
	}
	if ((indexPath.row*3+1)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*3+1];
		cell.lbl2.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn2 setTag:indexPath.row*3+1];
	}
	if ((indexPath.row*3+2)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*3+2];
		cell.lbl3.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn3 setTag:indexPath.row*3+2];
	}

     
	return cell;
     

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}



@end
