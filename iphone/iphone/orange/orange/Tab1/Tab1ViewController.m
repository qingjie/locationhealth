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
@synthesize alertViewListEmotion;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(filter:)];
   
 
    self.navigationItem.rightBarButtonItem = infoButton;
    self.title = @"Map";

	
    /*
    segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"List",@"Gird",nil]];
                                            
    [segmentedControl setFrame:CGRectMake(0,10,200,30)];
    //segmentedControl.center = CGPointMake(self.navigationController.navigationBar.bounds.size.width / 2, self.navigationController.navigationBar.bounds.size.height / 2);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = [UIColor orangeColor];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

    self.navigationItem.titleView = segmentedControl;
   */
    
    NSArray *array1 = [self.view subviews];
    if ([array1 count] == 2) {
        [[array1 objectAtIndex:1] removeFromSuperview];
    }
    mapViewController = [[MapViewController alloc] init];
    [self.view addSubview:mapViewController.view];
    
    
    [self loadData];
 
}

- (void)willPresentAlertView:(UIAlertView *)alertView{
    CGRect frame = alertView.frame;

    if( alertView == alertViewListEmotion)
	{
		frame.origin.y = 70;
		frame.size.height = 250;
		alertView.frame = frame;
		for( UIView * view in alertView.subviews )
		{
			if( ![view isKindOfClass:[UILabel class]] )
			{
                if (view.tag==1)
                {
                   	CGRect btnFrame1 =CGRectMake(10, frame.size.height-65, 105, 40);
					view.frame = btnFrame1;
					
                } else if  (view.tag==2){
                    
                    CGRect btnFrame2 =CGRectMake(165, frame.size.height-65, 105, 40);
                    view.frame = btnFrame2;
                }
			}
		}
		
       // accoutName = [[UITextView alloc] initWithFrame: CGRectMake( 30, 50,220, 90 )];
		//[alertView addSubview:accoutName];
		
		UITableView *myView = [[[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 140)
                                                            style:UITableViewStylePlain] autorelease];
        myView.delegate = self;
        myView.dataSource = self;
  
      
        
        [alertView addSubview:myView];
     
	}
    
    
    
}

- (void)filter:(id)sender
{
    
    alertViewListEmotion=[[UIAlertView alloc] initWithTitle:@"Select the emotion to display" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit",nil];
    alertViewListEmotion.tag = 666;
	[alertViewListEmotion show];
    
    /*
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select the emotion to display"
                                                    message:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    
    UITableView *myView = [[[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 140)
                                                        style:UITableViewStylePlain] autorelease];
    myView.delegate = self;
    myView.dataSource = self;
    //myView.backgroundColor = [UIColor clearColor];
    
    txtDescription = [[UITextField alloc] initWithFrame: CGRectMake( 20, 160,264, 10 )]; ;
  
    [alert addSubview:myView];
    [alert addSubview:txtDescription];
    
    [alert show];
     */
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	printf("User Pressed Button %d\n",buttonIndex+1);
	switch (buttonIndex) {
        case 0:
            //Cancel
            NSLog(@"---Cancel----");
            break;
        case 1:
            NSLog(@"---Submit----");
            //Set
            //NSLog(@"%@",[(CustomPickerView *)alertView getResult]);
			
           
			if (alertView.tag == 666) {
				NSLog(@"-----666----");
				
			}else if (alertView.tag == 888) {
				NSLog(@"----888----");
			}
			
			
            break;
        default:
            break;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	
	switch (textField.tag) {
		case 666:
			NSLog(@"========hello1============");
			//[textField becomeFirstResponder];
			
			
			break;
		default:
			break;
	}
    
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



-(void) loadData{
    itemArray=[[NSMutableArray alloc]init];
	NSArray * itemarray=[NSArray arrayWithObjects:
                         [[ImageAndTitle alloc]initWithImage:@"VeryHappy.png" Title:@"Very Happy" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"ExcitingHappy.png" Title:@"Exciting Happy" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"NotSoBad.png" Title:@"Not so bad" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Frustrated.png" Title:@"Frustrated" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Stressed.png" Title:@"Stressed" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Angry.png" Title:@"Angry" Color:@"0"],
                         [[ImageAndTitle alloc]initWithImage:@"Shy.png" Title:@"Shy" Color:@"0"],
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
    return 71;
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int i=[itemArray count]/4;
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
    
  	if ((indexPath.row*4)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4];
		cell.lbl1.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn1 setTag:indexPath.row*4];
        
	}
	if ((indexPath.row*4+1)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+1];
		cell.lbl2.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn2 setTag:indexPath.row*4+1];
       
	}
	if ((indexPath.row*4+2)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+2];
		cell.lbl3.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn3 setTag:indexPath.row*4+2];
        
	}
    if ((indexPath.row*4+3)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+3];
		cell.lbl4.text=[NSString stringWithFormat:@"%@",i.myTitle];
		[cell.btn4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn4 setTag:indexPath.row*4+3];
        
	}
    
	return cell;
    
    
}





@end
