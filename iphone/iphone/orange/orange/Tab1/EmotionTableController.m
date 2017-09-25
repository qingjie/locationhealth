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
                         [[ImageAndTitle alloc]initWithImage:@"Very Happy.png" Title:@"Very Happy"  Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Exciting Happy.png" Title:@"Exciting Happy" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Not so bad.png" Title:@"Not so bad" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Frustrated.png" Title:@"Frustrated"  Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Stressed.png" Title:@"Stressed" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Angry.png" Title:@"Angry" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Shy.png" Title:@"Shy"  Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Smile.png" Title:@"Smile" Color:@"0"],
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
