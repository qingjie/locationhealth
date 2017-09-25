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

@synthesize itemArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    itemArray = [MyDataSource fetchDailyReport];
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    double value = 0;
    
    
    for(int i=0;i<[itemArray count]; i++){
        //NSString *strName = [[itemArray objectAtIndex:i] objectForKey:@"name"];
        NSString *strValue = [[itemArray objectAtIndex:i] objectForKey:@"value"];
        //NSLog(@"----------,%@",strValue);
        value += [strValue intValue];
        [tempArray addObject:strValue];
        
        
    }
    
    NSLog(@"-----value-----,%.2f",value);
    NSMutableArray *arrayValue = [[NSMutableArray alloc] init];
    for (int i=0;i<[tempArray count];i++) {
        double j = [[tempArray objectAtIndex:i] intValue];
        double k = j/value;
        NSLog(@"%d",(int)round(k*100));
        
        //NSLog(@"=============,%.2f", j/value);
        
        [arrayValue addObject: [NSNumber numberWithInt:(int)round(k*100)]];
         
    }
    
    //[arrayValue addObject: [100 - [NSNumber numberWithInt:100*j/value] ]];
    
    NSMutableArray *arrayNameAndValue = [[NSMutableArray alloc] init];
    
    for(int i=0;i<[itemArray count]; i++){
        NSString *strName = [[itemArray objectAtIndex:i] objectForKey:@"name"];
        NSString *strValue = [[itemArray objectAtIndex:i] objectForKey:@"value"];
        double j = [strValue intValue];
        double k = j/value;
        //NSLog(@"%d",(int)round(k*100));
        NSString *str = [strName stringByAppendingFormat:@"  %d%%",(int)round(k*100)];
        NSLog(@"--------=======test========--------,%@",str);
        [arrayNameAndValue addObject:str];
        
    }
    
    
    self.view.backgroundColor = [UIColor blackColor];
    pieChartView = [[PieChartView alloc] initWithFrame:CGRectMake(10, 70, 320, 300)];
	//pieChartView.backgroundColor = [UIColor clearColor];
	//pieChartView.m_aPercent = [NSMutableArray arrayWithObjects:@"5",@"25",@"30",@"10",@"10",@"10",@"10",nil];
	//pieChartView.m_aHint = [NSMutableArray arrayWithObjects:@"A 5%",@"B 25%",@"C 30%",@"D 10%",@"E 10%",@"F 10%",@"G 10%",nil];
    
    pieChartView.m_aPercent = arrayValue;
    pieChartView.m_aHint = arrayNameAndValue;
   	[self.view addSubview: pieChartView];

}


@end
